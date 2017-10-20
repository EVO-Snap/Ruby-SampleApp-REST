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
module RbConfig
  # Merchant Profile Information
  ServiceID = '39C6700001'.freeze
  MerchantProfileId = ''.freeze
  UseWorkflow = false # bool: use workflows associated to ServiceKey?
  WorkflowId = ''.freeze
  ApplicationProfileId = ''.freeze

  # These values are provided during onboarding to the Snap platform.
  IdentityToken = ''.freeze
  PTLSSocketId = ''.freeze

  # Application Data Values
  ApplicationName = 'My Test App'.freeze
  SoftwareVersion = 'v1.0'.freeze
  # In "Demo Mode", the sample application verbosely outputs it's progress to
  # Standard Out.  Switch this to false to make the application's internal
  # state silent.
  VerboseOutput = true # bool
  SoftwareVersionDate = '2017-11-11'.freeze
  DeviceSerialNumber = '1264682310'.freeze
  ApplicationAttended = false # bool
  # Location of running app:
  # "Unknown", "OnPremises", "OffPremises", "HomeInternet"
  ApplicationLocation = 'OffPremises'.freeze
  ActivationKey = ''.freeze
  MerchantType = 'Managed'.freeze # Managed or Unmanaged

  # Should we use a proxy?
  UseProxy = false # bool
  ProxyHost = ''.freeze
  ProxyPort = ''.freeze

  # Should the application ignore certificate validation errors during https
  # connections?  Turn this on if you have to in testing, but it should be off
  # in production!
  NoCertVerify = false # bool

  # Salt, encryption key value for protecting the session.
  # You should generate your Salt and not use the default key provided
  Key = '1234567890123456ABCDEFGHIJKLMNOP'.freeze

  # Valid Values "PINNotSupported", "PINPadInoperative", "PINSupported",
  # "PINVerifiedByDevice", "Unknown"
  PINCapability = 'PINNotSupported'.freeze
  ReadCapability = 'KeyOnly'.freeze # Common Value Used "HasMSR", "KeyOnly"
  # Valid Values "IPADV1Compatible", "MagneSafeV4V5Compatible", "NotSet"
  EncryptionType = 'NotSet'.freeze

  # MerchantProfile Values
  # Valid Values "Ecommerce", "MOTO", "Retail", "Restaurant"
  IndustryType = 'Ecommerce'.freeze
  # Common Values Used [Ecommerce : Ecommerce] [MOTO : MOTO]
  # [Retail/Restaurant : Present]
  CustomerPresent = 'Ecommerce'.freeze
  # In general default to "IsCPSMeritCapable". Otherwise "NotCPSMeritCapable"
  RequestACI = 'IsCPSMeritCapable'.freeze
  # Valid Values [Ecommerce/MOTO : Keyed]
  # [Retail/Restaurant : Keyed/TrackDataFromMSR]
  EntryMode = 'Keyed'.freeze

  # TransactionData Values

  # bool: Depending on industrytype toggle between a swipe example and a
  # keyed transaction
  TxnData_ProcessAsKeyed = true
  # [Ecommerce/MOTO : Keyed] [Retail/Restaurant : Keyed/TrackDataFromMSR]
  TxnData_EntryMode = 'Keyed'.freeze
  # The order consists of three values seperated by Pipe.
  # Ex. Track2|Track1|Keyed
  TxnData_OrderOfProcessingTracks = 'Track2|Track1|Keyed'.freeze
  # bool: Magensa is an End to End encryptions solution offered through MagTek
  TxnData_ProcessMagensaTxn = false
  # Valid Values "Ecommerce", "MOTO", "Retail", "Restaurant"
  TxnData_IndustryType = 'Ecommerce'.freeze
  # [Ecommerce : Ecommerce] [MOTO : MOTO] [Retail/Restaurant : Present]
  TxnData_CustomerPresent = 'Ecommerce'.freeze
  # Some services require a UserId and Password
  TxnData_UserId = 'UTest'.freeze
  TxnData_Password = 'UPassword'.freeze
  # bool: For retail/restaurant should be configurable in their software and
  # should be marked whether or not software actually gets the signature for
  # each transaction
  TxnData_SignatureCaptured = false
  # The following values are all boolean:
  TxnData_IncludeAVS = true
  TxnData_IncludeCV = true
  TxnData_IncludeVPAS = false
  TxnData_IncludeUCAF = false
  TxnData_IncludeCFees = false
  TxnData_SoftDescriptors = false
  TxnData_SupportTokenization = false
  TxnData_ProcessEncrypted = false

  # bool: Process as a BankcardTransaction or as a BankcardTransactionPro object
  ProcessAsBankcardTransaction_Pro = false
  # If set to true the following Pro parameters are required
  Pro_PurchaseCardLevel = 'Level1'.freeze # "Level1", "Level2", "Level3"
  Pro_InterchangeData = false
  Pro_IncludeLevel2OrLevel3Data = false
  Pro_IncludeAlternativeMerchantData = false

  # ACH Transaction Data Values
  # WEB,PPD,CCD,BOC,TEL The three letter code that indicates what NACHA
  # regulations the transaction must adhere to. Required.
  TxnData_SECCode = 'WEB'.freeze
  # Indicates the Electronic Checking service type: ACH, RDC or ECK. Required.
  TxnData_ServiceType = 'ACH'.freeze

  # Endpoint Management
  # This should only be modified when upgrading your application to a more
  # recent version of the Snap* API.  Note, this would require recertification!
  BaseURL = 'api.cipcert.goevo.com'.freeze
  BasePath = '/2.1.28/REST'.freeze
end
