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

module Evo
  # The Txn class contains methods which allow you to make transactions against
  # the Snap* platform API.  Note that not all methods are implemented for all
  # merchants.  You'll want to fetch the Service Information to see which
  # methods can be run in your application.
  #
  # See: http://docs.evosnap.com/commerce-web-services/overview-transaction-processing/
  class Txn
    def self.authorize_encrypted(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => 'XXXX',
        'MerchantProfileId' => 'XXXX',
        'Transaction' => {
          '$type' => 'BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',

          'TenderData' => {
            # Encrypted Track 2 data returned by MagneSafe device
            # when card is swiped.
            'SecurePaymentAccountData'\
              => '87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28E'\
               + 'F9F7B7075E415545F9B9095C0AC5FA12B9905325',\
            'CardSecurityData' => {
              # Encrypted MagnePrint Information returned by the MagneSafe
              # device when card is swiped.
              'IdentificationInformation'\
              => '9ED72A486AB36DC352957C2C00607E937D1D90'\
               + 'CB8B09A8588629AABA8EAF0FD65296A4FBA490'\
               + 'EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E'\
            },
            # 20-char string returned by MagneSafe device when card is swiped.
            'EncryptionKeyId' => '9010010B0C2472000021',
            # MagnePrint Status of Card Swipe. This is an alpha numeric string,
            # returned by MagneSafe device when card is swiped.
            'SwipeStatus' => '00304061',
            'DeviceSerialNumber' => 'B0C2472071812AA'

          },
          'TransactionData' => {
            'Amount' => '10.00',
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'TransactionDateTime' => DateTime.now.iso8601,
            # Only set this for Force Post Voice Authorized transactions.
            'ApprovalCode' => nil,
            # Used only for PINDebit transactions
            'CashBackAmount' => '0.00',
            'CustomerPresent' => RbConfig::TxnData_CustomerPresent,
            'EmployeeId' => '1234',
            'EntryMode' => RbConfig::TxnData_EntryMode,
            'OrderNumber' => '12345',
            # This needs to be a unique value for each transaction
            'Reference' => '11',
            # Set to true if signature is captured physically or digitally
            'SignatureCaptured' => RbConfig::TxnData_SignatureCaptured,
            'TipAmount' => '0.00'
          }
        }
      }

      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id
      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.authorize(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'AuthorizeTransaction,'\
           + 'http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',\
        'ApplicationProfileId' => '',
        'MerchantProfileId' => '',
        'Transaction' => {
          '$type' => 'BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',

          'TenderData' => {
            'PaymentAccountDataToken' => nil, # Used in place of Card Data
            'SecurePaymentAccountData' => nil,
            'CardData' => {
              'CardType' => Evo::TypeCardType::MasterCard,
              'CardholderName' => nil,
              'PAN' => '5454545454545454',
              'Expire' => Date.today.>>(1).strftime('%m%y'), # Next month MMYY
              'Track1Data' => nil,
              'Track2Data' => nil
            },
            # AVS Data is optional.  For Keyed transactions the Postal Code will
            # help qualify your transaction for lower interchange
            'CardSecurityData' => {
              'AVSData' => {
                'CardholderName' => 'SJohnson',
                'Street' => '777 Cherry Street',
                'City' => 'Denver',
                'StateProvince' => 'CO',
                'PostalCode' => '80220',
                'Country' => Evo::ISOCountryCodeA3::USA,
                'Phone' => nil
              },
              # CVData is optional
              'CVDataProvided' => Evo::CVDataProvided::Provided,
              'CVData' => '111',
              'KeySerialNumber' => nil,
              'PIN' => nil
            }
          },
          'TransactionData' => {
            'Amount' => '10.00',
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'TransactionDateTime' => DateTime.now.iso8601,
            # Used only for PINDebit transactions
            # "AccountType" => Evo::AccountType::NotSet,
            # Only set this for Force Post Voice Authorized transactions.
            'ApprovalCode' => nil,
            # "CashBackAmount" => "0.00", # Used only for PINDebit transactions
            'CustomerPresent' => RbConfig::TxnData_CustomerPresent,
            'EmployeeId' => '1234',
            'EntryMode' => RbConfig::TxnData_EntryMode,
            # Used only for Ecommerce IndustryType transactions
            # "GoodsType" => Evo::GoodsType::DigitalGoods,
            # "InternetTransactionData" => {
            # "IpAddress" => "1.1.1.1",
            # "SessionId" => "12345"
            # },
            # "InvoiceNumber" => nil,
            'OrderNumber' => '12345',
            # "IsPartialShipment" => false, # Used in Ecommerce/MOTO
            # set to true if signature is captured physically or digitally
            'SignatureCaptured' => RbConfig::TxnData_SignatureCaptured,
            # 'TipAmount' => '0.00',
            # Only use the Override flag if you wish to force a duplicate
            # authorization through for the same card - same amount
            'TransactionCode' => Evo::TransactionCode::NotSet
          }
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.authorize_and_capture_encrypted(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => 'XXXX',
        'MerchantProfileId' => 'XXXX',
        'Transaction' => {
          '$type' => 'BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',

          'TenderData' => {
            # Encrypted Track 2 data returned by MagneSafe device when
            # card is swiped.
            'SecurePaymentAccountData'\
              => '87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28E'\
               + 'F9F7B7075E415545F9B9095C0AC5FA12B9905325',
            # Encrypted MagnePrint Information returned by the MagneSafe
            # device when card is swiped.
            'CardSecurityData' => {
              'IdentificationInformation'\
                => '9ED72A486AB36DC352957C2C00607E937D1D9'\
                 + '0CB8B09A8588629AABA8EAF0FD65296A4FBA4'\
                 + '90EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E'
            },
            # 20-character string returned by MagneSafe device when
            # card is swiped.
            'EncryptionKeyId' => '9010010B0C2472000021',
            # MagnePrint Status of Card Swipe. This is an alpha numeric string,
            # returned by MagneSafe device when card is swiped.
            'SwipeStatus' => '00304061',
            'DeviceSerialNumber' => 'B0C2472071812AA'

          },
          'TransactionData' => {
            'Amount' => '10.00',
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'TransactionDateTime' => DateTime.now.iso8601,
            # Only set this for Force Post Voice Authorized transactions.
            'ApprovalCode' => nil,
            # Used only for PINDebit transactions
            'CashBackAmount' => '0.00',
            'CustomerPresent' => RbConfig::TxnData_CustomerPresent,
            'EmployeeId' => '1234',
            'EntryMode' => RbConfig::TxnData_EntryMode,
            'OrderNumber' => '12345',
            # This needs to be a unique value for each transaction
            'Reference' => '11',
            # set to true if signature is captured physically or digitally
            'SignatureCaptured' => RbConfig::TxnData_SignatureCaptured,
            'TipAmount' => '0.00'
          }
        }
      }

      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id
      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.authorize_and_capture(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'AuthorizeAndCaptureTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'MerchantProfileId' => '',
        'Transaction' => {
          '$type' => 'BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',

          'TenderData' => {
            'PaymentAccountDataToken' => nil, # Used in place of Card Data
            'SecurePaymentAccountData' => nil,
            'CardData' => {
              'CardType' => Evo::TypeCardType::MasterCard,
              'CardholderName' => nil,
              'PAN' => '5454545454545454',
              'Expire' => Date.today.>>(1).strftime('%m%y'), # Next month MMYY
              'Track1Data' => nil,
              'Track2Data' => nil
            },
            # AVS Data is optional.  For Keyed transactions the Postal Code will
            # help qualify your transaction for lower interchange
            'CardSecurityData' => {
              'AVSData' => {
                'CardholderName' => 'SJohnson',
                'Street' => '777 Cherry Street',
                'City' => 'Denver',
                'StateProvince' => 'CO',
                'PostalCode' => '80220',
                'Country' => Evo::ISOCountryCodeA3::USA,
                'Phone' => nil
              },
              # CVData is optional
              'CVDataProvided' => Evo::CVDataProvided::Provided,
              'CVData' => '111',
              'KeySerialNumber' => nil,
              'PIN' => nil
            }
          },
          'TransactionData' => {
            'Amount' => '10.00',
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'TransactionDateTime' => DateTime.now.iso8601,
            # Used only for PINDebit transactions
            # 'AccountType' => Evo::AccountType::NotSet,
            # Only set this for Force Post Voice Authorized transactions.
            # 'ApprovalCode' => nil,
            # Used only for PINDebit transactions
            # 'CashBackAmount' => '0.00',
            'CustomerPresent' => RbConfig::TxnData_CustomerPresent,
            # 'EmployeeId' => '1234',
            'EntryMode' => RbConfig::TxnData_EntryMode,
            # Used only for Ecommerce IndustryType transactions
            # "GoodsType" => Evo::GoodsType::DigitalGoods,
            # "InternetTransactionData" => {
            # "IpAddress" => "1.1.1.1",
            # "SessionId" => "12345"
            # },
            # "InvoiceNumber" => nil,
            'OrderNumber' => '12345',
            'IsPartialShipment' => false, # Used in Ecommerce/MOTO
            # set to true if signature is captured physically or digitally
            'SignatureCaptured' => RbConfig::TxnData_SignatureCaptured,
            'TipAmount' => '0.00',
            # Only use the Override flag if you wish to force a duplicate
            # authorization through for the same card - same amount
            'TransactionCode' => Evo::TransactionCode::NotSet
          }
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.capture(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'Capture,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'DifferenceData' => {
          '$type' => 'BankcardCapture,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',
          'Amount' => '10.00',
          'TransactionId' => '--Transaction ID Required--',
          'TipAmount' => '0.00',
          'Addendum' => nil
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id + '/'\
          + request['DifferenceData']['TransactionId'],
        request,
        Net::HTTP::Put,
        RbConfig::BaseURL
      )
    end

    def self.undo(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'Undo,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'DifferenceData' => {
          '$type' => 'BankcardUndo,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',
          'TransactionId' => '--Transaction ID Required--',
          'Addendum' => nil
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id + '/'\
          + request['DifferenceData']['TransactionId'],
        request,
        Net::HTTP::Put,
        RbConfig::BaseURL
      )
    end

    def self.return_by_id(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'ReturnById,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'MerchantProfileId' => '',
        'DifferenceData' => {
          '$type' => 'BankcardReturn,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',
          'TransactionId' => '--Transaction ID Required--',
          # If amount is not set the full amount authorized will be returned.
          'Amount' => '1.00',
          'Addendum' => nil
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id
      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.return_unlinked_encrypted(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'AuthorizeTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => 'XXXX',
        'MerchantProfileId' => 'XXXX',
        'Transaction' => {
          '$type' => 'BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',

          'TenderData' => {
            # Encrypted Track 2 data returned by MagneSafe device when
            # card is swiped.
            'SecurePaymentAccountData'\
              => '87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28E'\
               + 'F9F7B7075E415545F9B9095C0AC5FA12B9905325',
            # Encrypted MagnePrint Information returned by the MagneSafe
            # device when card is swiped.
            'CardSecurityData' => {
              'IdentificationInformation'\
                => '9ED72A486AB36DC352957C2C00607E937D1D9'\
                 + '0CB8B09A8588629AABA8EAF0FD65296A4FBA4'\
                 + '90EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E'
            },
            # 20-character string returned by MagneSafe device when
            # card is swiped.
            'EncryptionKeyId' => '9010010B0C2472000021',
            # MagnePrint Status of Card Swipe. This is an alpha numeric string,
            # returned by MagneSafe device when card is swiped.
            'SwipeStatus' => '00304061',
            'DeviceSerialNumber' => 'B0C2472071812AA'

          },
          'TransactionData' => {
            'Amount' => '10.00',
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'TransactionDateTime' => DateTime.now.iso8601,
            # Only set this for Force Post Voice Authorized transactions.
            # 'ApprovalCode' => nil,
            # Used only for PINDebit transactions
            # 'CashBackAmount' => '0.00',
            'CustomerPresent' => RbConfig::TxnData_CustomerPresent,
            'EmployeeId' => '1234',
            'EntryMode' => RbConfig::TxnData_EntryMode,
            'OrderNumber' => '12345',
            # This needs to be a unique value for each transaction
            'Reference' => '11',
            # set to true if signature is captured physically or digitally
            # 'SignatureCaptured' => RbConfig::TxnData_SignatureCaptured,
            'TipAmount' => '0.00'
          }
        }
      }

      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id
      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.return_unlinked(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'ReturnTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'MerchantProfileId' => '',
        'Transaction' => {
          '$type' => 'BankcardTransaction,http://schemas.evosnap.com/CWS/v2.0/Transactions/Bankcard',

          'TenderData' => {
            'PaymentAccountDataToken' => nil, # Used in place of Card Data
            'SecurePaymentAccountData' => nil,
            'CardData' => {
              'CardType' => Evo::TypeCardType::MasterCard,
              'CardholderName' => nil,
              'PAN' => '5454545454545454',
              'Expire' => Date.today.>>(1).strftime('%m%y'), # Next month MMYY
              'Track1Data' => nil,
              'Track2Data' => nil
            },
            # AVS Data is optional.
            # For Keyed transactions the Postal Code will help qualify your
            # transaction for lower interchange
            'CardSecurityData' => {
              'AVSData' => {
                'CardholderName' => 'SJohnson',
                'Street' => '777 Cherry Street',
                'City' => 'Denver',
                'StateProvince' => 'CO',
                'PostalCode' => '80220',
                'Country' => Evo::ISOCountryCodeA3::USA,
                'Phone' => nil
              },
              # CVData is optional
              'CVDataProvided' => Evo::CVDataProvided::Provided,
              'CVData' => '111',
              'KeySerialNumber' => nil,
              'PIN' => nil
            }
          },
          'TransactionData' => {
            'Amount' => '10.00',
            'CurrencyCode' => Evo::TypeISOCurrencyCodeA3::USD,
            'TransactionDateTime' => DateTime.now.iso8601,
            # Used only for PINDebit transactions
            # "AccountType" => Evo::AccountType::NotSet,
            # Only set this for Force Post Voice Authorized transactions.
            # 'ApprovalCode' => nil,
            # Used only for PINDebit transactions
            # 'CashBackAmount' => '0.00',
            'CustomerPresent' => RbConfig::TxnData_CustomerPresent,
            # 'EmployeeId' => '1234',
            'EntryMode' => RbConfig::TxnData_EntryMode,
            # Used only for Ecommerce IndustryType transactions
            # "GoodsType" => Evo::GoodsType::DigitalGoods,
            # "InternetTransactionData" => {
            # "IpAddress" => "1.1.1.1",
            # "SessionId" => "12345"
            # },
            # "InvoiceNumber" => nil,
            'OrderNumber' => '12345',
            # "IsPartialShipment" => false, # Used in Ecommerce/MOTO
            # set to true if signature is captured physically or digitally
            'SignatureCaptured' => RbConfig::TxnData_SignatureCaptured,
            # 'TipAmount' => '0.00',
            # Only use the Override flag if you wish to force a duplicate
            # authorization through for the same card - same amount
            'TransactionCode' => Evo::TransactionCode::NotSet
          }
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id
      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id

      request = Evo.recursive_merge(defaults, request)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + evo_cws_client.workflow_id,
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.capture_all(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'CaptureAll,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'MerchantProfileId' => ''
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id
      defaults['MerchantProfileId'] = evo_cws_client.merchant_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Put,
        RbConfig::BaseURL
      )
    end

    def self.capture_selective(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = {
        '$type' => 'CaptureSelective,http://schemas.evosnap.com/CWS/v2.0/Transactions/Rest',
        'ApplicationProfileId' => '',
        'TransactionIds' => ['--Transaction ID Required--'],
        'DifferenceData' => {
          'Capture' => [{
            'Amount' => '10.00',
            'TransactionId' => '--Transaction ID Required--',
            'TipAmount' => '0.00',
            'Addendum' => nil
          }]
        }
      }

      defaults['ApplicationProfileId'] = evo_cws_client.application_profile_id

      request = Evo.recursive_merge(defaults, request)

      workflow_id = URI.encode(evo_cws_client.workflow_id)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/TPS.svc/' + workflow_id,
        request,
        Net::HTTP::Put,
        RbConfig::BaseURL
      )
    end
  end
end
