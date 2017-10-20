# This software and documentation is subject to and made
# available only pursuant to the terms of an executed license
# agreement, and may be used only in accordance with the terms
# of said agreement. This software may not, in whole or in part,
# be copied, photocopied, reproduced, translated, or reduced to
# any electronic medium or machine-readable form without
# prior consent, in writing, from EVO Payments International, INC.
#
# Use, duplication or disclosure by the U.S. Government is subject
# to restrictions set forth in an executed license agreement
# and in subparagraph (c)(1) of the Commercial Computer
# Software-Restricted Rights Clause at FAR 52.227-19; subparagraph
# (c)(1)(ii) of the Rights in Technical Data and Computer Software
# clause at DFARS 252.227-7013, subparagraph (d) of the Commercial
# Computer Software--Licensing clause at NASA FAR supplement
# 16-52.227-86; or their equivalent.
#
# Information in this software is subject to change without notice
# and does not represent a commitment on the part of EVO Payments International.
#
# Sample Code is for reference Only and is intended to be used for educational
# purposes. It's the responsibility of the software company to properly
# integrate into thier solution code that best meets thier production needs.
#
# Copyright:: 2017 EVO Payments International - All Rights Reserved
# License:: Proprietary

require 'net/http'
require 'time'
require 'base64'
require 'json'
require 'pp'

require_relative 'ApplicationAndMerchantSetup/2_application_data_management'
require_relative 'ApplicationAndMerchantSetup/3_get_service_information'
require_relative 'ApplicationAndMerchantSetup/4_merchant_profile_management'
require_relative 'TransactionProcessing/endpoint_txn'
require_relative 'TransactionProcessing/terminal_capture_workflow'
require_relative 'TransactionProcessing/host_capture_workflow'
require_relative 'TransactionManagementServices/txn_management_services'
require_relative 'TransactionManagementServices/tms_workflow'

module Evo
  # This class is a wrapper around the HTTP Snap* API, making it easier to make
  # API calls.
  class Client
    # Your Solutions Consultant may have commented out some of the lines below
    # to match your implementation.

    def initialize
      @do_log = RbConfig::VerboseOutput

      @session_token = ''
      @session_expires = Time.at(0)

      @merchant_profile_id = ''
      @application_profile_id = ''
      @workflow_id = ''
      @service_id = ''
      @full_path = ''
      @base_url = ''

      @last_call = ''
      # Used to debug the last called url.
    end

    attr_accessor :application_profile_id, :workflow_id, :service_id
    attr_accessor :merchant_profile_id
    attr_accessor :do_log
    attr_accessor :last_call

    def send(path, body, rest_action, url)
      update_session unless path == RbConfig::BasePath + '/SIS.svc/token'

      https = setup_https(path, rest_action, url)
      request = setup_request(path, rest_action, url)

      body = JSON.generate(body) unless body.nil?
      display_request(body) if @do_log

      response = https.start do |https_response|
        https_response.request(request, body)
      end

      display_response(response) if @do_log

      Evo::SimpleResponse.new(response)
    end

    private

    def setup_https(path, rest_action, url)
      go = if RbConfig::UseProxy == true
             Net::HTTP.new(url, 443, RbConfig::ProxyHost, RbConfig::ProxyPort)
           else
             Net::HTTP.new(url, 443)
           end
      go.use_ssl = true
      @last_call += ' to URL: ' + rest_action.to_s[11..-1] + ' ' + path

      go.verify_mode = OpenSSL::SSL::VERIFY_NONE if RbConfig::NoCertVerify
      go
    end

    def setup_request(path, rest_action, url)
      request = rest_action.new(path)

      request.basic_auth(@session_token, nil)
      request.set_content_type('application/json')
      # request.delete "accept"
      request.add_field('accept', 'application/json')
      request.add_field('Expect', '100-continue')
      request.add_field('Host', url)
      request
    end

    # The identity_token is a base64'd saml assertion that lasts 3 years.
    # The session_token is a base64'd saml assertion that lasts 30 minutes.
    # The SIS.svc/token endpoint only accepts the 3 year saml assertion,
    #  and replies with a session token in quotes.
    # All of the endpoints outside of SIS.svc expect a valid session_token.

    # update_session is called during each send to fetch the current session
    # token.  This way, on every call, we check to see if the sesion has expired
    # (as the SAML assertion lasts 30 minutes).  If the session_token is still
    # "fresh" we return that directly;  otherwise, we take the opportunity to
    # re-trigger the sign on process with the configured Identity Token.
    def update_session
      return @session_token if @session_expires > Time.now

      sign_on(RbConfig::IdentityToken)
    end

    # Session expiration time is stored within the base64 encoded session token.
    # For performance and sanity we'll extract it and store it as a Ruby time
    # at the moment it's generated by Snap*
    def manage_session_expiry
      match_expires = /(?<=NotOnOrAfter=\")[\s\S]*?(?=\")/
      match = match_expires.match(Base64.decode64(@session_token))
      @session_expires = Time.iso8601(match[0]) if match
      p "Security Token Expires on: #{@session_expires}" if @do_log
    end

    # sign_on is called any time the session token is invalid or expired.  We
    # make a call to the Snap* service which provides valid session tokens in
    # exchange for an identity token.
    def sign_on(identity_token)
      response = session_token_request(identity_token)

      if response.code != '200' || response.body.length < 100
        excp = 'Oops, session token missing. Response code = ' + response.code
        p excp, response.body if @do_log
        raise InvalidSessionRequestError, excp
      end

      @session_token = response.body[1, response.body.length - 2] # strip quotes

      manage_session_expiry
    end

    def session_token_request(identity_token)
      @session_token = identity_token

      p 'Requesting signOn...' + @session_token[0..32] if @do_log

      response = send(
        RbConfig::BasePath + '/SIS.svc/token',
        nil,
        Net::HTTP::Get,
        RbConfig::BaseURL
      )

      p 'Done requesting signOn!' if @do_log

      response
    end

    def display_request(body)
      return if body.nil?
      p 'Request Body:'
      begin
        pp JSON.parse(body)
      rescue JSON::ParserError
        p body
      end
    end

    def display_response(response)
      p 'Response (code ' + response.code + ') contains response:'
      begin
        pp JSON.parse(response.body)
      rescue JSON::ParserError
        p response.body
      end
      p '--------  --------  --------  --------  --------  --------  --------'
    end
  end

  class InvalidSessionRequestError < StandardError
  end
end

EvoCWSClient = Evo::Client
EvoCWS_endpoint_svcinfo = Evo::ServiceInformation
EvoCWS_endpoint_merchinfo = Evo::MerchantManagement
EvoCWS_endpoint_appdata = Evo::ApplicationManagement
EvoCWS_endpoint_txn = Evo::Txn
EvoCWS_endpoint_tms = Evo::Tms
