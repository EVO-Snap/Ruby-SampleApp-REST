module RbConfig

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

   #
   # Identity Token : Identity tokens are signed authentication tokens provided to merchants or other transaction originators to prevent the unauthorized use
   # of an application. Identity tokens are set to expire after 3 years, and therefore will require renewal. Identity tokens should be managed and protected in a
   # manner consistent with current key management best practices which may include access control, encryption, or use of specialized security devices. Identity
   # token owners are responsible for establishing practices for managing sensitive data like any other secure credential or business certificate.
   #
   #
  
  ActivationKey = "";
  MerchantType = "Managed"; # Managed or Unmanaged
  IdentityToken = "PHNhbWw6QXNzZXJ0aW9uIE1ham9yVmVyc2lvbj0iMSIgTWlub3JWZXJzaW9uPSIxIiBBc3NlcnRpb25JRD0iX2Y5ZTViZWIwLWQwNzYtNGYxZC1iNzNlLTc4YTlkOGJjZjUxYyIgSXNzdWVyPSJJcGNBdXRoZW50aWNhdGlvbiIgSXNzdWVJbnN0YW50PSIyMDEzLTEyLTI3VDE4OjAxOjM0LjE5MloiIHhtbG5zOnNhbWw9InVybjpvYXNpczpuYW1lczp0YzpTQU1MOjEuMDphc3NlcnRpb24iPjxzYW1sOkNvbmRpdGlvbnMgTm90QmVmb3JlPSIyMDEzLTEyLTI3VDE4OjAxOjM0LjE5MloiIE5vdE9uT3JBZnRlcj0iMjAxNi0xMi0yN1QxODowMTozNC4xOTJaIj48L3NhbWw6Q29uZGl0aW9ucz48c2FtbDpBZHZpY2U+PC9zYW1sOkFkdmljZT48c2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PHNhbWw6U3ViamVjdD48c2FtbDpOYW1lSWRlbnRpZmllcj4xM0ZBQjVFODEzRTAwMDAxPC9zYW1sOk5hbWVJZGVudGlmaWVyPjwvc2FtbDpTdWJqZWN0PjxzYW1sOkF0dHJpYnV0ZSBBdHRyaWJ1dGVOYW1lPSJTQUsiIEF0dHJpYnV0ZU5hbWVzcGFjZT0iaHR0cDovL3NjaGVtYXMuaXBjb21tZXJjZS5jb20vSWRlbnRpdHkiPjxzYW1sOkF0dHJpYnV0ZVZhbHVlPjEzRkFCNUU4MTNFMDAwMDE8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0iU2VyaWFsIiBBdHRyaWJ1dGVOYW1lc3BhY2U9Imh0dHA6Ly9zY2hlbWFzLmlwY29tbWVyY2UuY29tL0lkZW50aXR5Ij48c2FtbDpBdHRyaWJ1dGVWYWx1ZT5iN2Y2ZjAyNS0zYTg2LTQwMmQtOGMxNy0xOTE3NzM5NjUzZWI8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0ibmFtZSIgQXR0cmlidXRlTmFtZXNwYWNlPSJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcyI+PHNhbWw6QXR0cmlidXRlVmFsdWU+MTNGQUI1RTgxM0UwMDAwMTwvc2FtbDpBdHRyaWJ1dGVWYWx1ZT48L3NhbWw6QXR0cmlidXRlPjwvc2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PFNpZ25hdHVyZSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PFNpZ25lZEluZm8+PENhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzEwL3htbC1leGMtYzE0biMiPjwvQ2Fub25pY2FsaXphdGlvbk1ldGhvZD48U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnI3JzYS1zaGExIj48L1NpZ25hdHVyZU1ldGhvZD48UmVmZXJlbmNlIFVSST0iI19mOWU1YmViMC1kMDc2LTRmMWQtYjczZS03OGE5ZDhiY2Y1MWMiPjxUcmFuc2Zvcm1zPjxUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjZW52ZWxvcGVkLXNpZ25hdHVyZSI+PC9UcmFuc2Zvcm0+PFRyYW5zZm9ybSBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMTAveG1sLWV4Yy1jMTRuIyI+PC9UcmFuc2Zvcm0+PC9UcmFuc2Zvcm1zPjxEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjc2hhMSI+PC9EaWdlc3RNZXRob2Q+PERpZ2VzdFZhbHVlPkhSWVhUeVg4bUdqV09ubDQ4cHp2bEMya2oyMD08L0RpZ2VzdFZhbHVlPjwvUmVmZXJlbmNlPjwvU2lnbmVkSW5mbz48U2lnbmF0dXJlVmFsdWU+dUpOSUxkbExvMDY3RDhOdEozaktQMlJSNEYrU3dSQXBsc0R0Y1pLcG1mOXViK2F0U0R2Q3RkcVhpUEJWNDJlQ0UxYU5zZU5iWmYwei9TalB3bStnSEx0OEFzbks2Y1Z1NitaTmxrNnJoWHk2MEFNemJydElVUE5PWVZteU4rRHBnRS9mdC9ocnRZWTREd1NXaTdRbWZzWW1lSklyWHRiVTdlYlljaVNGTmE5a3NNZ0RBS0lmNTkzWkVqMmRIWWF2QTRBWUFrcTJJeU1LamRIRmlCMUVWVTZvR0p0bjBWM1ArZ2MyRWlsemFqelpwbVRTQk8vZWFFYzFGNnJkM1A4WDRraFgyZVBWN05yOEszQlExZ2cyRDlGb0J5dDRMWXE5NGMyZkJlRWx0Z0d4eFJ0QlRYRGRsdDY2TG5ab080WXVrdkQ4VGVlQnVvZW5vU1dDT0c0KytBPT08L1NpZ25hdHVyZVZhbHVlPjxLZXlJbmZvPjxvOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2UgeG1sbnM6bz0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzLzIwMDQvMDEvb2FzaXMtMjAwNDAxLXdzcy13c3NlY3VyaXR5LXNlY2V4dC0xLjAueHNkIj48bzpLZXlJZGVudGlmaWVyIFZhbHVlVHlwZT0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzL29hc2lzLXdzcy1zb2FwLW1lc3NhZ2Utc2VjdXJpdHktMS4xI1RodW1icHJpbnRTSEExIj5iQkcwU0cvd2RCNWJ4eVpyYjEvbTVLakhLMU09PC9vOktleUlkZW50aWZpZXI+PC9vOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2U+PC9LZXlJbmZvPjwvU2lnbmF0dXJlPjwvc2FtbDpBc3NlcnRpb24+";
  # encryption key value
  Key = "1234567890123456ABCDEFGHIJKLMNOP"; # Used for Salt for encryption and decryption.  You should generate your Salt and not use the default key provided
  UseWorkflow = true;  # true/false whether or not to use workflows associated to ServiceKey
  # Application Data Values 
  ApplicationName = "My Test App";
  SoftwareVersion = "v1.0";
  SoftwareVersionDate = "2013-12-02";
  DeviceSerialNumber = "1264682310";
  ApplicationAttended = false;   # Valid Values "true", "false" 
  ApplicationLocation = "OffPremises";   # Valid Values "Unknown", "OnPremises", "OffPremises", "HomeInternet" 
  PINCapability = "PINNotSupported";   # Valid Values "PINNotSupported", "PINPadInoperative", "PINSupported", "PINVerifiedByDevice", "Unknown" 
  ReadCapability = "KeyOnly";    # Common Value Used "HasMSR", "KeyOnly" 
  PTLSSocketId = "MIIFCzCCA/OgAwIBAgICAoAwDQYJKoZIhvcNAQEFBQAwgbExNDAyBgNVBAMTK0lQIFBheW1lbnRzIEZyYW1ld29yayBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhDb2xvcmFkbzEPMA0GA1UEBxMGRGVudmVyMRowGAYDVQQKExFJUCBDb21tZXJjZSwgSW5jLjEsMCoGCSqGSIb3DQEJARYdYWRtaW5AaXBwYXltZW50c2ZyYW1ld29yay5jb20wHhcNMTMwODIzMTg1NjA5WhcNMjMwODIxMTg1NjA5WjCBjDELMAkGA1UEBhMCVVMxETAPBgNVBAgTCENvbG9yYWRvMQ8wDQYDVQQHEwZEZW52ZXIxGjAYBgNVBAoTEUlQIENvbW1lcmNlLCBJbmMuMT0wOwYDVQQDEzRxYmtXM25TZ0FJQUFBUDhBSCtDY0FBQUVBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUE9MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx68dD32BLjiDC9RdkIFY2P8N/bzvV75qWWemh0hO3zswggMY6BtKM7xVAoeVbEUP/HxOSlBasKE4tY/Y9hfDoqaszojt5BfqGYqAnUZ/7yjlfROdDu5q1p7AJ8DsEg9o5rpp0/88tj1+XK43JpE0PHtRecCdpsiKGclAdvaGRiXVMR0U6/nNjoNdptSo3Kd8DXSU4xWfiwrVWYUMu9otetiwutJNB3jUfsW5incr1OZ7vkFa58Eltb57UygQ5i31FSrVuBfS4UMQKVBP1V7wsVQlcC+QBNjlsGiATzdqtJBgcaI+BkPEJkF7kpDae3fNbQ77AhVFsoGV30bZCSoSNwIDAQABo4IBTjCCAUowCQYDVR0TBAIwADAdBgNVHQ4EFgQU2t+wf1VVGvks5M1zZlNa92YYUAEwgeYGA1UdIwSB3jCB24AU3+ASnJQimuunAZqQDgNcnO2HuHShgbekgbQwgbExNDAyBgNVBAMTK0lQIFBheW1lbnRzIEZyYW1ld29yayBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkxCzAJBgNVBAYTAlVTMREwDwYDVQQIEwhDb2xvcmFkbzEPMA0GA1UEBxMGRGVudmVyMRowGAYDVQQKExFJUCBDb21tZXJjZSwgSW5jLjEsMCoGCSqGSIb3DQEJARYdYWRtaW5AaXBwYXltZW50c2ZyYW1ld29yay5jb22CCQD/yDY5hYVsVzA1BgNVHR8ELjAsMCqgKKAmhiRodHRwOi8vY3JsLmlwY29tbWVyY2UuY29tL2NhLWNybC5jcmwwDQYJKoZIhvcNAQEFBQADggEBAIGOvmbUPdUs3FMbQ95rpT7hShEkAbRnQjp8yY1ql48obQM0mTjQ4CfAXPELZ1xe8KyC4jaurW9KMuCkApwC8b8cgdKWg1ujtKkrNGhhDQRLcclNB6q5JTXrP0gQgrr43yHxh4vaAA8GTvkg7j2hrTUkksmc7JNIto0XsHlfvrUv8XCQIeQsFyy/nLHpQIkXwvAS6fcml6KMRTgQJm2yLZCfYVs6n18VDd9LCYWO9Y6majWoqgyHZ5Gy2qT7V+YxgDMUrZa7Fd66xHTWskO8wc7kuW5ZKaB29ewbAXIY31AHi4dAuGS6znPxnRg1kE01aDQ1FFCcajKtovg3di8PICU=";
  EncryptionType = "NotSet"; # Valid Values "IPADV1Compatible", "MagneSafeV4V5Compatible", "NotSet"
  
  # MerchantProfile Values 
  IndustryType = "Ecommerce";    # Valid Values "Ecommerce", "MOTO", "Retail", "Restaurant" 
  CustomerPresent = "Ecommerce";    # Common Values Used [Ecommerce : Ecommerce] [MOTO : MOTO] [Retail/Restaurant : Present] 
  RequestACI = "IsCPSMeritCapable";   # In general default to "IsCPSMeritCapable". Other value is "NotCPSMeritCapable" 
  EntryMode = "Keyed"; # Valid Values [Ecommerce/MOTO : Keyed] [Retail/Restaurant : Keyed/TrackDataFromMSR] 
  
  # TransactionData Values 
  
  TxnData_ProcessAsKeyed = true;   # "true", "false" Depending on industrytype toggle between a swipe example and a keyed transaction
  TxnData_EntryMode = "Keyed";   # [Ecommerce/MOTO : Keyed] [Retail/Restaurant : Keyed/TrackDataFromMSR] 
  TxnData_OrderOfProcessingTracks = "Track2|Track1|Keyed";    # The order consists of three values seperated by Pipe. Ex. Track2|Track1|Keyed 
  TxnData_ProcessMagensaTxn = false; # Magensa is an End to End encryptions solution offered through MagTek 
  TxnData_IndustryType = "Ecommerce";    # Valid Values "Ecommerce", "MOTO", "Retail", "Restaurant" 
  TxnData_CustomerPresent = "Ecommerce";    # [Ecommerce : Ecommerce] [MOTO : MOTO] [Retail/Restaurant : Present] 
  TxnData_UserId = "UTest";       # Some services require a UserId and Password
  TxnData_Password = "UPassword";   # Some services require a UserId and Password
  # ** ALL THE FOLOWING WERE IN SINGLE QUOTES IN HTTP
  TxnData_SignatureCaptured = false;   # "true", "false" - For retail/restaurant should be configurable in their software and should be marked whether or not software actually gets the signature for each transaction 
  TxnData_IncludeAVS = true;   # "true", "false" 
  TxnData_IncludeCV = true;      # "true", "false" 
  TxnData_IncludeVPAS = false;    # "true", "false" 
  TxnData_IncludeUCAF = false;    # "true", "false" 
  TxnData_IncludeCFees = false;   # "true", "false"
  TxnData_SoftDescriptors = false;    # "true", "false"
  # Support Tokenization
  TxnData_SupportTokenization = false; # "true", "false"
  TxnData_ProcessEncrypted = false;

  # Process as a BankcardTransaction object or as a BankcardTransactionPro object
  ProcessAsBankcardTransaction_Pro = false;   # "true", "false" If set to true the following Pro parameters are required
  # THE FOLLOWING WAS "true" NOT LEVEL1 IN HTTP
  Pro_PurchaseCardLevel = "Level1";   # "Level1", "Level2", "Level3" 
  Pro_InterchangeData = false;    # "true", "false"
  Pro_IncludeLevel2OrLevel3Data = false;    # "true", "false"
  Pro_IncludeAlternativeMerchantData = false;   # "true", "false"
  
  # ACH Transaction Data Values
  TxnData_SECCode = "WEB"; #  WEB,PPD,CCD,BOC,TEL The three letter code that indicates what NACHA regulations the transaction must adhere to. Required.
  TxnData_ServiceType = "ACH";   # Indicates the Electronic Checking service type: ACH, RDC or ECK. Required.
  
  # Endpoint Management
  BaseURL = "api.cipcert.goevo.com"
  BasePath = "/2.1.23/REST"
  
  # Merchant Profile Information
  ServiceID = "39C6700001";
  MerchantProfileId = "TestMerchant_39C6700001"; # TDC profile to use: TestMerchant_4C85600001, HDC Profile to Use: TestMerchant_39C6700001
  WorkflowId = "A021700001"; # Retail Decisions HDC WorkflowId: A121700001 HDC ServiceId: 39C6700001
  ApplicationProfileId = "8182";

end
