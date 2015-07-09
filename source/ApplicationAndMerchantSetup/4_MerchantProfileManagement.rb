
 # Copyright (c) 2013 EVO Payments International - All Rights Reserved.
 #
 # This software and documentation is subject to and made
 # available only pursuant to the terms of an executed license
 # agreement, and may be used only in accordance with the terms
 # of said agreement. This software may not, in whole or in part,
 # be copied, photocopied, reproduced, translated, or reduced to
 # any electronic medium or machine-readable form without
 # prior consent, in writing, from EVO Payments International
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
 # Sample Code is for reference Only and is intended to be used for educational purposes. It"s the responsibility of
 # the software company to properly integrate into thier solution code that best meets thier production needs.
 #
require 'time'
require 'open-uri'

module Evo
class MerchantManagement

    def self.get_merchant_profiles(evo_cws_client, workflow_id="")
    
    if (workflow_id == "") then
      workflow_id = evo_cws_client.workflow_id;
    end
    if (workflow_id != "") then
      params="serviceId="+URI::encode(workflow_id);
    else
        params=""
    end
        
    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
        evo_cws_client.send(RbConfig::BasePath + '/SIS.svc/merchprofile?'+params, nil, Net::HTTP::Get, RbConfig::BaseURL);
    end
    
    def self.get_merchant_profile(evo_cws_client, merchant_profile_id="", workflow_id="")
    
    if (workflow_id == "") then
      workflow_id = evo_cws_client.workflow_id;
    end
    if (workflow_id != "") then
      params="serviceId="+URI::encode(workflow_id);
    else
        params=""
    end
    
    if (merchant_profile_id == "") then
      merchant_profile_id = evo_cws_client.merchant_profile_id;
    end
    merchant_profile_id = URI::encode(merchant_profile_id);

    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
        evo_cws_client.send(RbConfig::BasePath + '/SIS.svc/merchprofile/'+merchant_profile_id+'?'+params, nil, Net::HTTP::Get, RbConfig::BaseURL);
    end
    
    
    
    def self.is_merchant_profile_initialized(evo_cws_client, merchant_profile_id = "", workflow_id="")
      
    if (workflow_id == "") then

      workflow_id = evo_cws_client.workflow_id;
    end
    if (workflow_id != "") then
      params="serviceId="+URI::encode(workflow_id);
    else
        params=""
    end
    
    if (merchant_profile_id == "") then
      merchant_profile_id = evo_cws_client.merchant_profile_id;
    end
    merchant_profile_id = URI::encode(merchant_profile_id);
    
    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
        result= evo_cws_client.send(RbConfig::BasePath + '/SIS.svc/merchprofile/'+merchant_profile_id+'/OK?'+params, nil, Net::HTTP::Get, RbConfig::BaseURL);

        if (result.data["RuleMessage"] == "true")
            result.data["Success"] = true;
        end
        result
    end
    
    def self.delete_merchant_profile(evo_cws_client, merchant_profile_id = "", workflow_id="")
    if (workflow_id == "") then
      workflow_id = evo_cws_client.workflow_id;
    end
    if (workflow_id != "") then
      params="serviceId="+URI::encode(workflow_id);
    else
        params=""
    end
    if (merchant_profile_id == "") then
      #false
      return
    end
    
    merchant_profile_id = URI::encode(merchant_profile_id);

    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
        evo_cws_client.send(RbConfig::BasePath + '/SIS.svc/merchprofile/'+merchant_profile_id+'?'+params, nil, Net::HTTP::Delete, RbConfig::BaseURL);
    end
    
    def self.save_merchant_profiles(evo_cws_client, merchant_profiles, workflow_id = "")
      
    if (workflow_id == "") then
      workflow_id = evo_cws_client.workflow_id;
    end
    if (workflow_id != "") then
      params="serviceId="+URI::encode(workflow_id);
    else
        params=""
    end
    merchant_profile_id = URI::encode(merchant_profile_id);
        
    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
        evo_cws_client.send(RbConfig::BasePath + '/SIS.svc/merchProfile?'+params, merchant_profiles, Net::HTTP::Put, RbConfig::BaseURL);
    end
    
    def self.save_merchant_profile(evo_cws_client, merchant_profile, workflow_id = "")
      defaults= {
      "ProfileId" => "TestMerchant_" + workflow_id, #"Unique Value Created by your application goes here", 
      "WorkflowId" => "", # aka ServiceId
      "MerchantData" => {
        "CustomerServiceInternet" => "",
        "CustomerServicePhone" => "555 5550123",
        "Language" => "ENG",
        "Address" => {
          "Street1" => "123 Main Street",
          "Street2" => "",
          "City" => "Denver",
          "StateProvince" => "CO",
          "PostalCode" => "80202",
          "CountryCode" => "USA"
        },
        "MerchantId" => "123456789012",
        "Name" => "TestMerchant", #Business name for merchant
        "Phone" => "720 3773700",
        "TaxId" => "",
        "BankcardMerchantData" => {
          "IndustryType" => RbConfig::IndustryType,
          "SIC" => "5734",
          "TerminalId" => "123"
          
        }
      },
      "TransactionData" => {
        "BankcardTransactionDataDefaults" => {
          "CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
          "CustomerPresent" => RbConfig::CustomerPresent,
          "EntryMode" => RbConfig::EntryMode,
          "RequestACI" => RbConfig::RequestACI,
          "RequestAdvice" => Evo::RequestAdvice::Capable
        }
      }
    };
      
     if (workflow_id == "") then
      workflow_id = evo_cws_client.workflow_id;
    end
    if (workflow_id != "") then
      params="serviceId="+URI::encode(workflow_id);
    else
        params=""
    end  
    
    defaults["WorkflowId"] = evo_cws_client.workflow_id;
        
        merchant_profiles = Array.new
    merchant_profiles = [Evo.recursive_merge(defaults, merchant_profile)];
    
   p "WorkflowId = " + workflow_id;
            
    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
        response = evo_cws_client.send(RbConfig::BasePath + '/SIS.svc/merchProfile?'+params, merchant_profiles, Net::HTTP::Put, RbConfig::BaseURL);
      
     
    end

end
end

