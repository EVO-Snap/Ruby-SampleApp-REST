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
  # The ApplicationManagement class contains methods which handle initial
  # handshaking between this application and the Snap* API.
  class ApplicationManagement
    def self.save_application_data(evo_cws_client) # rubocop:disable Metrics/MethodLength
      defaults = {
        'ApplicationAttended' => RbConfig::ApplicationAttended,
        'ApplicationLocation' => RbConfig::ApplicationLocation,
        'ApplicationName' => RbConfig::ApplicationName,
        'EncryptionType' => RbConfig::EncryptionType,
        'HardwareType' => Evo::HardwareType::PC,
        'PINCapability' => RbConfig::PINCapability,
        'PTLSSocketId' => RbConfig::PTLSSocketId,
        'ReadCapability' => RbConfig::ReadCapability,
        'SerialNumber' => 208_093_707,
        'SoftwareVersion' => RbConfig::SoftwareVersion,
        'SoftwareVersionDate' => RbConfig::SoftwareVersionDate
      }

      request = defaults; # Evo.recursive_merge(defaults, request);

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/SIS.svc/appprofile',
        request, Net::HTTP::Put, RbConfig::BaseURL
      )
    end

    def self.get_application_data(evo_cws_client, app_id)
      if app_id == ''
        app_id = evo_cws_client.application_profile_id
        return
      end
      app_id = URI.encode(app_id)
      evo_cws_client.last_call = self.class + method

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send('/SIS.svc/appprofile/' + app_id, nil, Net::HTTP::Get)
    end

    def self.delete_application_data(evo_cws_client, app_id)
      # We wont just default to deleting the main application profile.
      return if app_id == ''

      app_id = URI.encode(app_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/SIS.svc/appprofile/' + app_id,
        nil,
        Net::HTTP::Delete,
        RbConfig::BaseURL
      )
    end

    def self.get_service_info(evo_cws_client)
      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/SIS.svc/serviceinformation',
        nil,
        Net::HTTP::Get,
        RbConfig::BaseURL
      )
    end
  end
end
