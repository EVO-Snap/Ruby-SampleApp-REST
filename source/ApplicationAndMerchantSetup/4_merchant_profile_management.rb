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

require 'time'
require 'open-uri'

module Evo
  # The MerchantManagement class provides a series of methods used during
  # bootstrapping the application to fetch the merchant configuration from
  # the Snap* API.  The Merchant data contains information about the merchant's
  # location, terminal capabilities, etc.
  class MerchantManagement
    def self.get_merchant_profiles(cws_client, workflow_id = '')
      workflow_id = cws_client.workflow_id if workflow_id == ''
      params = 'serviceId=' + URI.encode(workflow_id) if workflow_id != ''

      cws_client.last_call = name + '::' + __method__.to_s
      cws_client.send(
        RbConfig::BasePath + '/SIS.svc/merchprofile?' + params,
        nil,
        Net::HTTP::Get,
        RbConfig::BaseURL
      )
    end

    def self.get_merchant_profile( # rubocop:disable Metrics/MethodLength
      cws_client,
      merchant_profile_id = '',
      workflow_id = ''
    )
      workflow_id = cws_client.workflow_id if workflow_id == ''
      params = 'serviceId=' + URI.encode(workflow_id) if workflow_id != ''

      if merchant_profile_id == ''
        merchant_profile_id = cws_client.merchant_profile_id
      end
      merchant_profile_id = URI.encode(merchant_profile_id)

      cws_client.last_call = name + '::' + __method__.to_s
      cws_client.send(
        RbConfig::BasePath + '/SIS.svc/merchprofile/' + merchant_profile_id \
          + '?' + params,
        nil,
        Net::HTTP::Get,
        RbConfig::BaseURL
      )
    end

    def self.merchant_profile_initialized?( # rubocop:disable Metrics/MethodLength
      cws_client,
      merchant_profile_id = ''
    )
      if merchant_profile_id == ''
        merchant_profile_id = cws_client.merchant_profile_id
      end
      merchant_profile_id = URI.encode(merchant_profile_id)

      cws_client.last_call = name + '::' + __method__.to_s
      result = cws_client.send(
        RbConfig::BasePath + '/SIS.svc/merchprofile/' + merchant_profile_id \
          + '/OK',
        nil,
        Net::HTTP::Get,
        RbConfig::BaseURL
      )

      result.data['Success'] = true if result.data['RuleMessage'] == 'true'
      result
    end

    def self.delete_merchant_profile(
      cws_client,
      merchant_profile_id = ''
    )
      merchant_profile_id = URI.encode(merchant_profile_id)
      return if merchant_profile_id == ''

      cws_client.last_call = name + '::' + __method__.to_s
      cws_client.send(
        RbConfig::BasePath + '/SIS.svc/merchprofile/' + merchant_profile_id \
          + '?' + params,
        nil,
        Net::HTTP::Delete,
        RbConfig::BaseURL
      )
    end

    def self.save_merchant_profiles(
      cws_client,
      merchant_profiles,
      workflow_id = ''
    )
      workflow_id = cws_client.workflow_id if workflow_id == ''
      params = 'serviceId=' + URI.encode(workflow_id) if workflow_id != ''

      cws_client.last_call = name + '::' + __method__.to_s
      cws_client.send(
        RbConfig::BasePath + '/SIS.svc/merchProfile?' + params,
        merchant_profiles,
        Net::HTTP::Put,
        RbConfig::BaseURL
      )
    end

    def self.merchant_profile_defaults # rubocop:disable Metrics/MethodLength
      {
        # "Unique Value Created by your application goes here"
        'ProfileId' => 'TestMerchant_' + workflow_id,
        'WorkflowId' => '', # aka ServiceId
        'MerchantData' => {
          'CustomerServiceInternet' => '',
          'CustomerServicePhone' => '555 5550123',
          'Language' => 'ENG',
          'Address' => {
            'Street1' => '123 Main Street',
            'Street2' => '',
            'City' => 'Denver',
            'StateProvince' => 'CO',
            'PostalCode' => '80202',
            'CountryCode' => 'USA'
          },
          'MerchantId' => '123456789012',
          'Name' => 'TestMerchant', # Business name for merchant
          'Phone' => '720 3773700',
          'TaxId' => '',
          'BankcardMerchantData' => {
            'IndustryType' => RbConfig::IndustryType,
            'SIC' => '5734',
            'TerminalId' => '123'

          }
        },
        'TransactionData' => {
          'BankcardTransactionDataDefaults' => {
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'CustomerPresent' => RbConfig::CustomerPresent,
            'EntryMode' => RbConfig::EntryMode,
            'RequestACI' => RbConfig::RequestACI,
            'RequestAdvice' => Evo::RequestAdvice::Capable
          }
        }
      }
    end

    def self.save_merchant_profile( # rubocop:disable Metrics/MethodLength
      cws_client,
      merchant_profile,
      workflow_id = ''
    )
      workflow_id = cws_client.workflow_id if workflow_id == ''
      params = 'serviceId=' + URI.encode(workflow_id) if workflow_id != ''

      defaults = get_merchant_profile_defaults

      defaults['WorkflowId'] = cws_client.workflow_id

      merchant_profiles = [Evo.recursive_merge(defaults, merchant_profile)]

      cws_client.last_call = name + '::' + __method__.to_s
      cws_client.send(
        RbConfig::BasePath + '/SIS.svc/merchProfile?' + params,
        merchant_profiles,
        Net::HTTP::Put,
        RbConfig::BaseURL
      )
    end
  end
end
