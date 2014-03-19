
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

module Evo
class Txn
	def self.authorize_encrypted(evo_cws_client, request)
		defaults= {
			"$type" => "AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
			"ApplicationProfileId" => "XXXX",
			"MerchantProfileId" => "XXXX",
			"Transaction" => {
				"$type" => "BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
				
				"TenderData" => {
					"SecurePaymentAccountData" => "87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325", #Encrypted Track 2 data returned by MagneSafe device when card is swiped. 
					"CardSecurityData" => {
						 "IdentificationInformation" => "9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E", # Encrypted MagnePrint� Information returned by the MagneSafe� device when card is swiped.
						},
						"EncryptionKeyId" => "9010010B0C2472000021",  # 20-character string returned by MagneSafe device when card is swiped.
						"SwipeStatus" => "00304061", # MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
						"DeviceSerialNumber" => "B0C2472071812AA"

				},
				"TransactionData" => {
					"Amount" => "10.00",
					"CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
					"TransactionDateTime" => "2012-03-22T14:57:28-06:00",
					"ApprovalCode" => nil, # Only set this for Force Post Voice Authorized transactions.
					"CashBackAmount" => "0.00", # Used only for PINDebit transactions
					"CustomerPresent" => RbConfig::TxnData_CustomerPresent,
					"EmployeeId" => "1234",
					"EntryMode" => RbConfig::TxnData_EntryMode,
					"OrderNumber" => "12345",
					"Reference" => "11", # This needs to be a unique value for each transaction
					"SignatureCaptured" => RbConfig::TxnData_SignatureCaptured, # set to true if signature is captured physically or digitally
					"TipAmount" => "0.00"
				}
			}
		};

		defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;
		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;

		request = Evo.recursive_merge(defaults, request);

		workflow_id = URI::encode(evo_cws_client.workflow_id);

		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send( RbConfig::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
	end

	def self.authorize(evo_cws_client, request)
		defaults= {
			"$type" => "AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
						"ApplicationProfileId" => "",
			"MerchantProfileId" => "",
			"Transaction" => {
				"$type" => "BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
				
				"TenderData" => {
          "PaymentAccountDataToken" => nil,  # Used in place of Card Data
          "SecurePaymentAccountData" => nil,
          "CardData" => {
            "CardType" => Evo::TypeCardType::MasterCard,
            "CardholderName" => nil,
            "PAN" => "5454545454545454",
            "Expire" => "1215",
            "Track1Data" => nil,
            "Track2Data" => nil
          },
           #AVS Data is optional.  For Keyed transactions the Postal Code will help qualify your transaction for lower interchange
          "CardSecurityData" => {
            "AVSData" => {
              "CardholderName" => "SJohnson",
              "Street" => "777 Cherry Street",
              "City" => "Denver",
              "StateProvince" => "CO",
              "PostalCode" => "10101",
              "Country" => Evo::ISOCountryCodeA3::USA,
              "Phone" => nil
            },
             # CVData is optional
            "CVDataProvided" => Evo::CVDataProvided::Provided,
            "CVData" => "111",
            "KeySerialNumber" => nil,
            "PIN" => nil
          }
        },
				"TransactionData" => {
					"Amount" => "10.00",
					"CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
					"TransactionDateTime" => "2012-03-22T14:57:28-06:00",
					#"AccountType" => Evo::AccountType::NotSet, # Used only for PINDebit transactions
					"ApprovalCode" => nil, # Only set this for Force Post Voice Authorized transactions.
					#"CashBackAmount" => "0.00", # Used only for PINDebit transactions
					"CustomerPresent" => RbConfig::TxnData_CustomerPresent,
					#"EmployeeId" => "1234", #Used for Retail, MOTO, Restaurant IndustryTypes
					"EntryMode" => RbConfig::TxnData_EntryMode,
					# "GoodsType" => Evo::GoodsType::DigitalGoods, # Used only for Ecommerce IndustryType transactions
					#"InternetTransactionData" => {
						#"IpAddress" => "1.1.1.1",
						#"SessionId" => "12345"
					#},
					#"InvoiceNumber" => nil,
					"OrderNumber" => "12345",
					#"IsPartialShipment" => false, # Used in Ecommerce/MOTO
					"SignatureCaptured" => RbConfig::TxnData_SignatureCaptured, # set to true if signature is captured physically or digitally
					#"TipAmount" => "0.00",
          "TransactionCode" => Evo::TransactionCode::NotSet  # Only use the Override flag if you wish to force a duplicate authorization through for the same card - same amount
				}
			}
		};

		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;


		defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;

		request = Evo.recursive_merge(defaults, request);

		workflow_id = URI::encode(evo_cws_client.workflow_id);
		
		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send( RbConfig::BasePath + '/txn/'+workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
	end
def self.authorize_and_capture_encrypted(evo_cws_client, request)
    defaults= {
      "$type" => "AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
      "ApplicationProfileId" => "XXXX",
      "MerchantProfileId" => "XXXX",
      "Transaction" => {
        "$type" => "BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
        
        "TenderData" => {
          "SecurePaymentAccountData" => "87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325", #Encrypted Track 2 data returned by MagneSafe device when card is swiped. 
          "CardSecurityData" => {
             "IdentificationInformation" => "9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E", # Encrypted MagnePrint� Information returned by the MagneSafe� device when card is swiped.
            },
            "EncryptionKeyId" => "9010010B0C2472000021",  # 20-character string returned by MagneSafe device when card is swiped.
            "SwipeStatus" => "00304061", # MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
            "DeviceSerialNumber" => "B0C2472071812AA"

        },
        "TransactionData" => {
          "Amount" => "10.00",
          "CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
          "TransactionDateTime" => "2012-03-22T14:57:28-06:00",
          "ApprovalCode" => nil, # Only set this for Force Post Voice Authorized transactions.
          "CashBackAmount" => "0.00", # Used only for PINDebit transactions
          "CustomerPresent" => RbConfig::TxnData_CustomerPresent,
          "EmployeeId" => "1234",
          "EntryMode" => RbConfig::TxnData_EntryMode,
          "OrderNumber" => "12345",
          "Reference" => "11", # This needs to be a unique value for each transaction
          "SignatureCaptured" => RbConfig::TxnData_SignatureCaptured, # set to true if signature is captured physically or digitally
          "TipAmount" => "0.00"
        }
      }
    };

    defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;
    defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;

    request = Evo.recursive_merge(defaults, request);

    workflow_id = URI::encode(evo_cws_client.workflow_id);

    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
    evo_cws_client.send( RbConfig::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
  end
  
def self.authorize_and_capture(evo_cws_client, request)
    defaults= {
      "$type" => "AuthorizeAndCaptureTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
            "ApplicationProfileId" => "",
      "MerchantProfileId" => "",
      "Transaction" => {
        "$type" => "BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
       
        "TenderData" => {
          "PaymentAccountDataToken" => nil,  # Used in place of Card Data
          "SecurePaymentAccountData" => nil,
          "CardData" => {
            "CardType" => Evo::TypeCardType::MasterCard,
            "CardholderName" => nil,
            "PAN" => "5454545454545454",
            "Expire" => "1215",
            "Track1Data" => nil,
            "Track2Data" => nil
          },
           #AVS Data is optional.  For Keyed transactions the Postal Code will help qualify your transaction for lower interchange
          "CardSecurityData" => {
            "AVSData" => {
              "CardholderName" => "SJohnson",
              "Street" => "777 Cherry Street",
              "City" => "Denver",
              "StateProvince" => "CO",
              "PostalCode" => "10101",
              "Country" => Evo::ISOCountryCodeA3::USA,
              "Phone" => nil
            },
             # CVData is optional
            "CVDataProvided" => Evo::CVDataProvided::Provided,
            "CVData" => "111",
            "KeySerialNumber" => nil,
            "PIN" => nil
          }
        },
        "TransactionData" => {
          "Amount" => "10.00",
          "CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
          "TransactionDateTime" => "2012-03-22T14:57:28-06:00",
          #"AccountType" => Evo::AccountType::NotSet, # Used only for PINDebit transactions
          #"ApprovalCode" => nil, # Only set this for Force Post Voice Authorized transactions.
          #"CashBackAmount" => "0.00", # Used only for PINDebit transactions
          "CustomerPresent" => RbConfig::TxnData_CustomerPresent,
          #"EmployeeId" => "1234", #Useed for Retail, MOTO, and Restuarant IndustryTypes
          "EntryMode" => RbConfig::TxnData_EntryMode,
          # "GoodsType" => Evo::GoodsType::DigitalGoods, # Used only for Ecommerce IndustryType transactions
          #"InternetTransactionData" => {
            #"IpAddress" => "1.1.1.1",
            #"SessionId" => "12345"
          #},
          #"InvoiceNumber" => nil,
          "OrderNumber" => "12345",
          "IsPartialShipment" => false, # Used in Ecommerce/MOTO
          "SignatureCaptured" => RbConfig::TxnData_SignatureCaptured, # set to true if signature is captured physically or digitally          
          "TipAmount" => "0.00",
          "TransactionCode" => Evo::TransactionCode::NotSet  # Only use the Override flag if you wish to force a duplicate authorization through for the same card - same amount
        }
      }
    };

    defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;


    defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;

    request = Evo.recursive_merge(defaults, request);

    workflow_id = URI::encode(evo_cws_client.workflow_id);
    
    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
    evo_cws_client.send( RbConfig::BasePath + '/txn/'+workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
  end


	def self.capture(evo_cws_client, request)
		defaults={
			 "$type" => "Capture,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
			 "ApplicationProfileId" => "",
			 "DifferenceData" => {
				 "$type" => "BankcardCapture,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
				 "Amount" => "10.00",
				 "TransactionId" => "--Transaction ID Required--",
				 "TipAmount" => "0.00",
				 "Addendum" => nil 
			 }
		 };

		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;

		request = Evo.recursive_merge(defaults, request);

		workflow_id = URI::encode(evo_cws_client.workflow_id);
		
		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send(RbConfig::BasePath + '/txn/'+workflow_id+'/'+request['DifferenceData']['TransactionId'], request, Net::HTTP::Put, RbConfig::BaseURL);
	end

	def self.undo(evo_cws_client, request)
		defaults={
			"$type" => "Undo,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
			"ApplicationProfileId" => "",
			"DifferenceData" => {
				"$type" => "BankcardUndo,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
				"TransactionId" => "--Transaction ID Required--",
				"Addendum" => nil 
			}
		};

		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;

		request = Evo.recursive_merge(defaults, request)

		workflow_id = URI::encode(evo_cws_client.workflow_id);
		
		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send(RbConfig::BasePath + '/txn/' + workflow_id+'/'+request['DifferenceData']['TransactionId'], request, Net::HTTP::Put, RbConfig::BaseURL);
	end

  def self.return_by_id(evo_cws_client, request)
    defaults={
      "$type" => "ReturnById,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
      "ApplicationProfileId" => "",
      "MerchantProfileId" => "",
      "DifferenceData" => {
        "$type" => "BankcardReturn,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
        "TransactionId" => "--Transaction ID Required--",
        "Amount" => "1.00", # If amount is not set the full amount authorized will be returned.
        "Addendum" => nil 
      }
    };
    
    defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;
    defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;


    request = Evo.recursive_merge(defaults, request)

    workflow_id = URI::encode(evo_cws_client.workflow_id);
    
    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
    evo_cws_client.send(RbConfig::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
  end
  def self.return_unlinked_encrypted(evo_cws_client, request)
    defaults= {
      "$type" => "AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
      "ApplicationProfileId" => "XXXX",
      "MerchantProfileId" => "XXXX",
      "Transaction" => {
        "$type" => "BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
        
        "TenderData" => {
          "SecurePaymentAccountData" => "87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325", #Encrypted Track 2 data returned by MagneSafe device when card is swiped. 
          "CardSecurityData" => {
             "IdentificationInformation" => "9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E", # Encrypted MagnePrint� Information returned by the MagneSafe� device when card is swiped.
            },
            "EncryptionKeyId" => "9010010B0C2472000021",  # 20-character string returned by MagneSafe device when card is swiped.
            "SwipeStatus" => "00304061", # MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
            "DeviceSerialNumber" => "B0C2472071812AA"

        },
        "TransactionData" => {
          "Amount" => "10.00",
          "CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
          "TransactionDateTime" => "2012-03-22T14:57:28-06:00",
          #"ApprovalCode" => nil, # Only set this for Force Post Voice Authorized transactions.
          #"CashBackAmount" => "0.00", # Used only for PINDebit transactions
          "CustomerPresent" => RbConfig::TxnData_CustomerPresent,
          "EmployeeId" => "1234",
          "EntryMode" => RbConfig::TxnData_EntryMode,
          "OrderNumber" => "12345",
          "Reference" => "11", # This needs to be a unique value for each transaction
          "SignatureCaptured" => RbConfig::TxnData_SignatureCaptured, # set to true if signature is captured physically or digitally
          "TipAmount" => "0.00"
        }
      }
    };

    defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;
    defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;

    request = Evo.recursive_merge(defaults, request);

    workflow_id = URI::encode(evo_cws_client.workflow_id);

    evo_cws_client.last_call = self.name + "::" + __method__.to_s;
    evo_cws_client.send( RbConfig::BasePath + '/txn/'+ workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
  end
  
	def self.return_unlinked(evo_cws_client, request)
		defaults={
			"$type" => "ReturnTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
						"ApplicationProfileId" => "",
			"MerchantProfileId" => "",
			"Transaction" => {
				"$type" => "BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard",
				
				"TenderData" => {
					"PaymentAccountDataToken" => nil,  # Used in place of Card Data
					"SecurePaymentAccountData" => nil,
					"CardData" => {
						"CardType" => Evo::TypeCardType::MasterCard,
						"CardholderName" => nil,
						"PAN" => "5454545454545454",
						"Expire" => "1215",
						"Track1Data" => nil,
						"Track2Data" => nil
					},
					# AVS Data is optional.  For Keyed transactions the Postal Code will help qualify your transaction for lower interchange
					"CardSecurityData" => {
						"AVSData" => {
							"CardholderName" => "SJohnson",
							"Street" => "777 Cherry Street",
							"City" => "Denver",
							"StateProvince" => "CO",
							"PostalCode" => "10101",
							"Country" => Evo::ISOCountryCodeA3::USA,
							"Phone" => nil
						},
						 # CVData is optional
						"CVDataProvided" => Evo::CVDataProvided::Provided,
						"CVData" => "111",
						"KeySerialNumber" => nil,
						"PIN" => nil
					}
				},
				"TransactionData" => {
					"Amount" => "10.00",
					"CurrencyCode" => Evo::TypeISOCurrencyCodeA3::USD,
					"TransactionDateTime" => "2012-03-22T14:57:28-06:00",
					#"AccountType" => Evo::AccountType::NotSet, # Used only for PINDebit transactions
					#"ApprovalCode" => nil, # Only set this for Force Post Voice Authorized transactions.
					#"CashBackAmount" => "0.00", # Used only for PINDebit transactions
					"CustomerPresent" => RbConfig::TxnData_CustomerPresent,
					#"EmployeeId" => "1234", #Used for Retail, MOTO, and Restaurant IndustryTypes
					"EntryMode" => RbConfig::TxnData_EntryMode,
					# "GoodsType" => Evo::GoodsType::DigitalGoods, # Used only for Ecommerce IndustryType transactions
					#"InternetTransactionData" => {
						#"IpAddress" => "1.1.1.1",
						#"SessionId" => "12345"
					#},
					#"InvoiceNumber" => nil,
					"OrderNumber" => "12345",
					#"IsPartialShipment" => false, # Used in Ecommerce/MOTO
					"SignatureCaptured" => RbConfig::TxnData_SignatureCaptured, # set to true if signature is captured physically or digitally
					#"TipAmount" => "0.00",
          "TransactionCode" => Evo::TransactionCode::NotSet  # Only use the Override flag if you wish to force a duplicate authorization through for the same card - same amount
				}
			}
		};

		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;
		defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;

		request = Evo.recursive_merge(defaults, request);

		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send(RbConfig::BasePath + '/txn/'+evo_cws_client.workflow_id, request, Net::HTTP::Post, RbConfig::BaseURL);
	end


	def self.capture_all(evo_cws_client, request)
		defaults={
			"$type" => "CaptureAll,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
			"ApplicationProfileId" => "",
			"MerchantProfileId" => ""
		};

		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;
		defaults["MerchantProfileId"] = evo_cws_client.merchant_profile_id;

		request = Evo.recursive_merge(defaults, request);

		workflow_id = URI::encode(evo_cws_client.workflow_id);
		
		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send(RbConfig::BasePath + '/txn/'+workflow_id, request, Net::HTTP::Put, RbConfig::BaseURL);
	end


	def self.capture_selective(evo_cws_client, request)
		defaults={
			"$type" => "CaptureSelective,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest",
			"ApplicationProfileId" => "",
			"TransactionIds" => ["--Transaction ID Required--"],
			"DifferenceData" => {
				"Capture" => [{
					"Amount" => "10.00",
					"TransactionId" => "--Transaction ID Required--",
					"TipAmount" => "0.00",
					"Addendum" => nil
				}]
			}
		};

		defaults["ApplicationProfileId"] = evo_cws_client.application_profile_id;

		request = Evo.recursive_merge(defaults, request);

		workflow_id = URI::encode(evo_cws_client.workflow_id);
		
		evo_cws_client.last_call = self.name + "::" + __method__.to_s;
		evo_cws_client.send(RbConfig::BasePath + '/txn/'+workflow_id, request, Net::HTTP::Put, RbConfig::BaseURL);
	end

end
end
