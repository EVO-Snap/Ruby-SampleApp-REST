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

# The following two classes are provided for the merchant(redemption)
# and publisher endpoints.
module Evo
  class HttpMethod
    Get = 'GET'.freeze
    Post = 'POST'.freeze
    Put = 'PUT'.freeze
    Delete = 'DELETE'.freeze
  end

  class TransactionCode
    NotSet = 'NotSet'.freeze
    Override = 'Override'.freeze
  end
  class AccountType
    CheckingAccount = 'CheckingAccount'.freeze
    NotSet = 'NotSet'.freeze
    SavingsAccount = 'SavingsAccount'.freeze
  end

  class AddressResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class AdviceResponse
    DoNotHonor = 'DoNotHonor'.freeze
    DoNotTryAgainLater = 'DoNotTryAgainLater'.freeze
    NewAccountInfoAvailable = 'NewAccountInfoAvailable'.freeze
    NotSet = 'NotSet'.freeze
    TryAgainLater = 'TryAgainLater'.freeze
    Unsupported = 'Unsupported'.freeze
  end

  class ApplicationLocation
    HomeInternet = 'HomeInternet'.freeze
    NotSet = 'NotSet'.freeze
    OffPremises = 'OffPremises'.freeze
    OnPremises = 'OnPremises'.freeze
    Unknown = 'Unknown'.freeze
  end

  class BillPayment
    DeferredBilling = 'DeferredBilling'.freeze
    Installment = 'Installment'.freeze
    NotSet = 'NotSet'.freeze
    Recurring = 'Recurring'.freeze
    SinglePayment = 'SinglePayment'.freeze
  end

  class CardholderNameResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class ChargeType
    BeautyShop = 'BeautyShop'.freeze
    ConventionFee = 'ConventionFee'.freeze
    GiftShop = 'GiftShop'.freeze
    GolfProShop = 'GolfProShop'.freeze
    HealthSpa = 'HealthSpa'.freeze
    Lodging = 'Lodging'.freeze
    NotSet = 'NotSet'.freeze
    Restaurant = 'Restaurant'.freeze
    RetailOther = 'RetailOther'.freeze
    TennisProShop = 'TennisProShop'.freeze
  end

  class CityResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class CommercialCardResponse
    BusinessCard = 'BusinessCard'.freeze
    CorporateCard = 'CorporateCard'.freeze
    NonCommercialCard = 'NonCommercialCard'.freeze
    NotImplemented = 'NotImplemented'.freeze
    NotSet = 'NotSet'.freeze
    PurchaseCard = 'PurchaseCard'.freeze
    PurchaseCardDataUnsupported = 'PurchaseCardDataUnsupported'.freeze
    Unknown = 'Unknown'.freeze
  end

  class CountryResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class CustomerPresent
    BillPayment = 'BillPayment'.freeze
    Ecommerce = 'Ecommerce'.freeze
    MailFax = 'MailFax'.freeze
    MOTO = 'MOTO'.freeze
    MOTOCC = 'MOTOCC'.freeze
    NotSet = 'NotSet'.freeze
    Present = 'Present'.freeze
    Suspicious = 'Suspicious'.freeze
    TelARU = 'TelARU'.freeze
    Transponder = 'Transponder'.freeze
    VisaCardPresentStripeUnreadable = 'VisaCardPresentStripeUnreadable'.freeze
    VisaOpenNetworkTransaction = 'VisaOpenNetworkTransaction'.freeze
    VoiceResponse = 'VoiceResponse'.freeze
  end

  class ExistingDebt
    IsExistingDebt = 'IsExistingDebt'.freeze
    NotExistingDebt = 'NotExistingDebt'.freeze
    NotSet = 'NotSet'.freeze
  end

  class GoodsType
    DigitalGoods = 'DigitalGoods'.freeze
    NotSet = 'NotSet'.freeze
    PhysicalGoods = 'PhysicalGoods'.freeze
  end

  class HardwareType
    ATM = 'ATM'.freeze
    DialTerminal = 'DialTerminal'.freeze
    ElectronicCashRegister = 'ElectronicCashRegister'.freeze
    InitiatedCAT = 'InitiatedCAT'.freeze
    InStoreController = 'InStoreController'.freeze
    Mainframe = 'Mainframe'.freeze
    MobileBanking = 'MobileBanking'.freeze
    NotSet = 'NotSet'.freeze
    PC = 'PC'.freeze
    POSPartner = 'POSPartner'.freeze
    POSPort = 'POSPort'.freeze
    ScriptDevice = 'ScriptDevice'.freeze
    Telephone = 'Telephone'.freeze
    ThirdPartyDeveloper = 'ThirdPartyDeveloper'.freeze
    TicketMachine = 'TicketMachine'.freeze
    Unknown = 'Unknown'.freeze
    VirtualTerminal = 'VirtualTerminal'.freeze
  end

  class IIASDesignation
    IIASExempt = 'IIASExempt'.freeze
    IIASVerified = 'IIASVerified'.freeze
    NotSet = 'NotSet'.freeze
  end

  class Interval
    Day = 'Day'.freeze
    Month = 'Month'.freeze
    NotSet = 'NotSet'.freeze
    Week = 'Week'.freeze
    Year = 'Year'.freeze
  end

  class IsTaxExempt
    Exempt = 'Exempt'.freeze
    NotExemptTaxInfoNotProvided = 'NotExemptTaxInfoNotProvided'.freeze
    NotExemptTaxInfoProvided = 'NotExemptTaxInfoProvided'.freeze
    NotSet = 'NotSet'.freeze
  end

  class PartialApprovalSupportType
    Capable = 'Capable'.freeze
    NotCapable = 'NotCapable'.freeze
    NotSet = 'NotSet'.freeze
  end

  class PhoneResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class PINCapability
    NotSet = 'NotSet'.freeze
    PINNotSupported = 'PINNotSupported'.freeze
    PINPadInoperative = 'PINPadInoperative'.freeze
    PINSupported = 'PINSupported'.freeze
    PINVerifiedByDevice = 'PINVerifiedByDevice'.freeze
    Unknown = 'Unknown'.freeze
  end

  class PINDebitUndoReason
    CADFailure = 'CADFailure'.freeze
    CustomerCancellation = 'CustomerCancellation'.freeze
    LateResponse = 'LateResponse'.freeze
    NoResponse = 'NoResponse'.freeze
    NotApplicable = 'NotApplicable'.freeze
    NotSet = 'NotSet'.freeze
    OriginalAmountIncorrect = 'OriginalAmountIncorrect'.freeze
    PartiallyCompleted = 'PartiallyCompleted'.freeze
    ResponseIncomplete = 'ResponseIncomplete'.freeze
    ResponseTimeout = 'ResponseTimeout'.freeze
    SuspectMalfunction = 'SuspectMalfunction'.freeze
    UnableToDeliverResponse = 'UnableToDeliverResponse'.freeze
    UnableToDeliverToPOS = 'UnableToDeliverToPOS'.freeze
  end

  class PostalCodeResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class ReadCapability
    ARUIVR = 'ARUIVR'.freeze
    BarCodeReader = 'BarCodeReader'.freeze
    Chip = 'Chip'.freeze
    ContactlessChip = 'ContactlessChip'.freeze
    ContactlessMSR = 'ContactlessMSR'.freeze
    ECR = 'ECR'.freeze
    EmvICC = 'EmvICC'.freeze
    HasMSR = 'HasMSR'.freeze
    KeyOnly = 'KeyOnly'.freeze
    MSREMVICC = 'MSREMVICC'.freeze
    NFCCapable = 'NFCCapable'.freeze
    NoMSR = 'NoMSR'.freeze
    NoTerminal = 'NoTerminal'.freeze
    NotSet = 'NotSet'.freeze
    NotSpecified = 'NotSpecified'.freeze
    OCRReader = 'OCRReader'.freeze
    RFIDCapable = 'RFIDCapable'.freeze
    Unknown = 'Unknown'.freeze
    VSCCapable = 'VSCCapable'.freeze
  end

  class RequestACI
    CPSMeritCapableIncAuth = 'CPSMeritCapableIncAuth'.freeze
    IsCPSMeritCapable = 'IsCPSMeritCapable'.freeze
    NotCPSMeritCapable = 'NotCPSMeritCapable'.freeze
    NotSet = 'NotSet'.freeze
    PremierCustomer = 'PremierCustomer'.freeze
    RecurringInstallment = 'RecurringInstallment'.freeze
  end

  class RequestAdvice
    Capable = 'Capable'.freeze
    NotCapable = 'NotCapable'.freeze
    NotSet = 'NotSet'.freeze
  end

  class RequestCommercialCard
    Disable = 'Disable'.freeze
    Enable = 'Enable'.freeze
    NotSet = 'NotSet'.freeze
  end

  class Resubmit
    NotPermitted = 'NotPermitted'.freeze
    NotSet = 'NotSet'.freeze
    Permitted = 'Permitted'.freeze
    Unspecified = 'Unspecified'.freeze
  end

  class ReturnedACI
    A = 'A'.freeze
    C = 'C'.freeze
    E = 'E'.freeze
    F = 'F'.freeze
    I = 'I'.freeze
    K = 'K'.freeze
    M = 'M'.freeze
    N = 'N'.freeze
    NotSet = 'NotSet'.freeze
    NQ = 'NQ'.freeze
    P = 'P'.freeze
    R = 'R'.freeze
    S = 'S'.freeze
    T = 'T'.freeze
    U = 'U'.freeze
    V = 'V'.freeze
    W = 'W'.freeze
    Y = 'Y'.freeze
  end

  class StateResult
    BadFormat = 'BadFormat'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponseFromCardAssociation = 'NoResponseFromCardAssociation'.freeze
    NotIncluded = 'NotIncluded'.freeze
    NotSet = 'NotSet'.freeze
    NotVerified = 'NotVerified'.freeze
    UnknownResponseFromCardAssociation =
      'UnknownResponseFromCardAssociation'.freeze
  end

  class TokenIndicator
    AttemptedCardUnsupported = 'AttemptedCardUnsupported'.freeze
    AttemptedServiceUnavailable = 'AttemptedServiceUnavailable'.freeze
    NotSet = 'NotSet'.freeze
    UCAFWithData = 'UCAFWithData'.freeze
    UCAFWithoutData = 'UCAFWithoutData'.freeze
    VPAS = 'VPAS'.freeze
  end

  class TypeCardType
    AmericanExpress = 'AmericanExpress'.freeze
    CarteAurore = 'CarteAurore'.freeze
    CartesBancaires = 'CartesBancaires'.freeze
    CitibankFinancial = 'CitibankFinancial'.freeze
    Dankort = 'Dankort'.freeze
    DinersCartBlanche = 'DinersCartBlanche'.freeze
    DinersClub = 'DinersClub'.freeze
    Discover = 'Discover'.freeze
    Electron = 'Electron'.freeze
    Finax = 'Finax'.freeze
    JCB = 'JCB'.freeze
    Kopkort = 'Kopkort'.freeze
    LaserCard = 'LaserCard'.freeze
    Maestro = 'Maestro'.freeze
    MasterCard = 'MasterCard'.freeze
    NotSet = 'NotSet'.freeze
    PrivateLabel = 'PrivateLabel'.freeze
    RevolutionCard = 'RevolutionCard'.freeze
    Solo = 'Solo'.freeze
    UnbrandedATM = 'UnbrandedATM'.freeze
    Visa = 'Visa'.freeze
  end

  class TypeTaxType
    CityTax = 'CityTax'.freeze
    CountyParishTax = 'CountyParishTax'.freeze
    CountyTax = 'CountyTax'.freeze
    EnergyTax = 'EnergyTax'.freeze
    EnvironmentalTax = 'EnvironmentalTax'.freeze
    FederalTax = 'FederalTax'.freeze
    GoodsServicesTax = 'GoodsServicesTax'.freeze
    HarmonizedTax = 'HarmonizedTax'.freeze
    LocalSalesTax = 'LocalSalesTax'.freeze
    LuxuryTax = 'LuxuryTax'.freeze
    MunicipalTax = 'MunicipalTax'.freeze
    NotSet = 'NotSet'.freeze
    OccupancyTax = 'OccupancyTax'.freeze
    OtherTax = 'OtherTax'.freeze
    QuebecSalesTax = 'QuebecSalesTax'.freeze
    RoomTax = 'RoomTax'.freeze
    StateLocalSalesTax = 'StateLocalSalesTax'.freeze
    StateProvincialGoodsTax = 'StateProvincialGoodsTax'.freeze
    StateProvincialTax = 'StateProvincialTax'.freeze
    StateSalesTax = 'StateSalesTax'.freeze
    Unknown = 'Unknown'.freeze
    VAT = 'VAT'.freeze
  end

  class CaptureState
    BatchSent = 'BatchSent'.freeze
    BatchSentUndoPermitted = 'BatchSentUndoPermitted'.freeze
    CannotCapture = 'CannotCapture'.freeze
    Captured = 'Captured'.freeze
    CaptureDeclined = 'CaptureDeclined'.freeze
    CapturedUndoPermitted = 'CapturedUndoPermitted'.freeze
    CaptureError = 'CaptureError'.freeze
    CapturePending = 'CapturePending'.freeze
    CapturePendingUndoPermitted = 'CapturePendingUndoPermitted'.freeze
    CaptureUnknown = 'CaptureUnknown'.freeze
    InProcess = 'InProcess'.freeze
    NotSet = 'NotSet'.freeze
    ReadyForCapture = 'ReadyForCapture'.freeze
    UndoReported = 'UndoReported'.freeze
  end

  class CVDataProvided
    CardholderStatesNotAvailable = 'CardholderStatesNotAvailable'.freeze
    DeliberatelyBypass = 'DeliberatelyBypass'.freeze
    NotSet = 'NotSet'.freeze
    Provided = 'Provided'.freeze
    ValueIllegible = 'ValueIllegible'.freeze
  end

  class CVResult
    Invalid = 'Invalid'.freeze
    IssuerNotCertified = 'IssuerNotCertified'.freeze
    Match = 'Match'.freeze
    NoCodePresent = 'NoCodePresent'.freeze
    NoMatch = 'NoMatch'.freeze
    NoResponse = 'NoResponse'.freeze
    NotApplicable = 'NotApplicable'.freeze
    NotProcessed = 'NotProcessed'.freeze
    NotSet = 'NotSet'.freeze
    ShouldHaveBeenPresent = 'ShouldHaveBeenPresent'.freeze
  end

  class EntryMode
    Barcode = 'Barcode'.freeze
    ChipReliable = 'ChipReliable'.freeze
    ChipTrackDataFromRFID = 'ChipTrackDataFromRFID'.freeze
    ChipUnreliable = 'ChipUnreliable'.freeze
    ContactlessMChipOrSmartCard = 'ContactlessMChipOrSmartCard'.freeze
    ContactlessStripe = 'ContactlessStripe'.freeze
    Keyed = 'Keyed'.freeze
    KeyedBadMagRead = 'KeyedBadMagRead'.freeze
    MSRTrackDataFromRFID = 'MSRTrackDataFromRFID'.freeze
    NFCCapable = 'NFCCapable'.freeze
    NotSet = 'NotSet'.freeze
    OCRReader = 'OCRReader'.freeze
    TerminalNotUsed = 'TerminalNotUsed'.freeze
    Track2DataFromMSR = 'Track2DataFromMSR'.freeze
    TrackDataFromMSR = 'TrackDataFromMSR'.freeze
    VSCCapable = 'VSCCapable'.freeze
  end

  class IndustryType
    Ecommerce = 'Ecommerce'.freeze
    MOTO = 'MOTO'.freeze
    NotSet = 'NotSet'.freeze
    Restaurant = 'Restaurant'.freeze
    Retail = 'Retail'.freeze
  end

  class Status
    Failure = 'Failure'.freeze
    NotSet = 'NotSet'.freeze
    Successful = 'Successful'.freeze
  end

  class TenderType
    Credit = 'Credit'.freeze
    NotSet = 'NotSet'.freeze
    PINDebit = 'PINDebit'.freeze
  end

  class TransactionState
    Adjusted = 'Adjusted'.freeze
    Authorized = 'Authorized'.freeze
    Captured = 'Captured'.freeze
    CaptureDeclined = 'CaptureDeclined'.freeze
    Declined = 'Declined'.freeze
    ErrorConnecting = 'ErrorConnecting'.freeze
    ErrorUnknown = 'ErrorUnknown'.freeze
    ErrorValidation = 'ErrorValidation'.freeze
    InProcess = 'InProcess'.freeze
    NotSet = 'NotSet'.freeze
    PartiallyCaptured = 'PartiallyCaptured'.freeze
    PartiallyReturned = 'PartiallyReturned'.freeze
    PartialReturnRequested = 'PartialReturnRequested'.freeze
    Returned = 'Returned'.freeze
    ReturnRequested = 'ReturnRequested'.freeze
    ReturnUndone = 'ReturnUndone'.freeze
    Undone = 'Undone'.freeze
    Verified = 'Verified'.freeze
  end

  class BatchAssignmentSupport
    NotSet = 'NotSet'.freeze
    NotSupported = 'NotSupported'.freeze
    Supported = 'Supported'.freeze
    SupportedWithCaptureAll = 'SupportedWithCaptureAll'.freeze
  end

  class CloseBatch
    NotSet = 'NotSet'.freeze
    NotSupported = 'NotSupported'.freeze
    Required = 'Required'.freeze
    Supported = 'Supported'.freeze
  end

  class CreditAuthorizeSupportType
    AuthorizeAndCaptureOnly = 'AuthorizeAndCaptureOnly'.freeze
    AuthorizeOnly = 'AuthorizeOnly'.freeze
    Both = 'Both'.freeze
  end

  class CreditReturnSupportType
    Both = 'Both'.freeze
    Linked = 'Linked'.freeze
    Standalone = 'Standalone'.freeze
    Unsupported = 'Unsupported'.freeze
  end

  class CreditReversalSupportType
    Both = 'Both'.freeze
    Captured = 'Captured'.freeze
    NotSupported = 'NotSupported'.freeze
    ReadyForCapture = 'ReadyForCapture'.freeze
  end

  class EncryptionType
    IPADV1Compatible = 'IPADV1Compatible'.freeze
    MagneSafeV4V5Compatible = 'MagneSafeV4V5Compatible'.freeze
    NotSet = 'NotSet'.freeze
  end

  class PINDebitReturnSupportType
    Both = 'Both'.freeze
    Linked = 'Linked'.freeze
    Standalone = 'Standalone'.freeze
    Unsupported = 'Unsupported'.freeze
  end

  class PinDebitUndoSupportType
    NotSupported = 'NotSupported'.freeze
    Supported = 'Supported'.freeze
  end

  class PurchaseCardLevel
    Level1 = 'Level1'.freeze
    Level2 = 'Level2'.freeze
    Level3 = 'Level3'.freeze
    NotSet = 'NotSet'.freeze
  end

  class QueryRejectedSupportType
    NotSupported = 'NotSupported'.freeze
    SupportedWithDateRange = 'SupportedWithDateRange'.freeze
    SupportedWithSpecificDate = 'SupportedWithSpecificDate'.freeze
  end

  class TrackDataSupportType
    Both = 'Both'.freeze
    NotSet = 'NotSet'.freeze
    NotSupported = 'NotSupported'.freeze
    Track1 = 'Track1'.freeze
    Track2 = 'Track2'.freeze
  end

  class CardType
    NotSet = 'NotSet'.freeze
    PrivateLabel = 'PrivateLabel'.freeze
    Visa = 'Visa'.freeze
    MasterCard = 'MasterCard'.freeze
    AmericanExpress = 'AmericanExpress'.freeze
    DinersCartBlanche = 'DinersCartBlanche'.freeze
    Discover = 'Discover'.freeze
    JCB = 'JCB'.freeze
    CitibankFinancial = 'CitibankFinancial'.freeze
    RevolutionCard = 'RevolutionCard'.freeze
    UnbrandedATM = 'UnbrandedATM'.freeze
  end

  class TypeISOLanguageCodeA3
    ENG = 'ENG'.freeze
  end

  class TypeISOCurrencyCodeA3
    NotSet = 'NotSet'.freeze
    USD = 'USD'.freeze;		# US Dollar
    CAD = 'CAD'.freeze;		# Canadian Dollar
    MXN = 'MXN'.freeze;	# Mexican Peso
    EUR = 'EUR'.freeze;	# Euro
  end

  class ISOCountryCodeA3
    NotSet = 'NotSet'.freeze
    USA = 'USA'.freeze;	# USA
    CAN = 'CAN'.freeze;	# Canada
    MEX = 'MEX'.freeze;	# Mexico
  end

  class ErrorType
    Validation = 'Validation'.freeze
    Processing = 'Processing'.freeze
    System = 'System'.freeze
  end
end
