
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
#The following two classes are provided for the merchant(redemption) and publisher endpoints.
module Evo

class HttpMethod
	Get = "GET"; 
	Post = "POST";
	Put = "PUT";
	Delete = "DELETE";
end

class TransactionCode
   NotSet = "NotSet";
   Override = "Override";
end
class AccountType
	CheckingAccount = "CheckingAccount";
	NotSet = "NotSet";
	SavingsAccount = "SavingsAccount";
end


class AddressResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class AdviceResponse
	DoNotHonor = "DoNotHonor";
	DoNotTryAgainLater = "DoNotTryAgainLater";
	NewAccountInfoAvailable = "NewAccountInfoAvailable";
	NotSet = "NotSet";
	TryAgainLater = "TryAgainLater";
	Unsupported = "Unsupported";
end


class ApplicationLocation
	HomeInternet = "HomeInternet";
	NotSet = "NotSet";
	OffPremises = "OffPremises";
	OnPremises = "OnPremises";
	Unknown = "Unknown";
end


class BillPayment
	DeferredBilling = "DeferredBilling";
	Installment = "Installment";
	NotSet = "NotSet";
	Recurring = "Recurring";
	SinglePayment = "SinglePayment";
end


class CardholderNameResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class ChargeType
	BeautyShop = "BeautyShop";
	ConventionFee = "ConventionFee";
	GiftShop = "GiftShop";
	GolfProShop = "GolfProShop";
	HealthSpa = "HealthSpa";
	Lodging = "Lodging";
	NotSet = "NotSet";
	Restaurant = "Restaurant";
	RetailOther = "RetailOther";
	TennisProShop = "TennisProShop";
end


class CityResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class CommercialCardResponse
	BusinessCard = "BusinessCard";
	CorporateCard = "CorporateCard";
	NonCommercialCard = "NonCommercialCard";
	NotImplemented = "NotImplemented";
	NotSet = "NotSet";
	PurchaseCard = "PurchaseCard";
	PurchaseCardDataUnsupported = "PurchaseCardDataUnsupported";
	Unknown = "Unknown";
end


class CountryResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class CustomerPresent
	BillPayment = "BillPayment";
	Ecommerce = "Ecommerce";
	MailFax = "MailFax";
	MOTO = "MOTO";
	MOTOCC = "MOTOCC";
	NotSet = "NotSet";
	Present = "Present";
	Suspicious = "Suspicious";
	TelARU = "TelARU";
	Transponder = "Transponder";
	VisaCardPresentStripeUnreadable = "VisaCardPresentStripeUnreadable";
	VisaOpenNetworkTransaction = "VisaOpenNetworkTransaction";
	VoiceResponse = "VoiceResponse";
end


class ExistingDebt
	IsExistingDebt = "IsExistingDebt";
	NotExistingDebt = "NotExistingDebt";
	NotSet = "NotSet";
end


class GoodsType
	DigitalGoods = "DigitalGoods";
	NotSet = "NotSet";
	PhysicalGoods = "PhysicalGoods";
end


class HardwareType
	ATM = "ATM";
	DialTerminal = "DialTerminal";
	ElectronicCashRegister = "ElectronicCashRegister";
	InitiatedCAT = "InitiatedCAT";
	InStoreController = "InStoreController";
	Mainframe = "Mainframe";
	MobileBanking = "MobileBanking";
	NotSet = "NotSet";
	PC = "PC";
	POSPartner = "POSPartner";
	POSPort = "POSPort";
	ScriptDevice = "ScriptDevice";
	Telephone = "Telephone";
	ThirdPartyDeveloper = "ThirdPartyDeveloper";
	TicketMachine = "TicketMachine";
	Unknown = "Unknown";
	VirtualTerminal = "VirtualTerminal";
end


class IIASDesignation
	IIASExempt = "IIASExempt";
	IIASVerified = "IIASVerified";
	NotSet = "NotSet";
end


class Interval
	Day = "Day";
	Month = "Month";
	NotSet = "NotSet";
	Week = "Week";
	Year = "Year";
end


class IsTaxExempt
	Exempt = "Exempt";
	NotExemptTaxInfoNotProvided = "NotExemptTaxInfoNotProvided";
	NotExemptTaxInfoProvided = "NotExemptTaxInfoProvided";
	NotSet = "NotSet";
end


class PartialApprovalSupportType
	Capable = "Capable";
	NotCapable = "NotCapable";
	NotSet = "NotSet";
end


class PhoneResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class PINCapability
	NotSet = "NotSet";
	PINNotSupported = "PINNotSupported";
	PINPadInoperative = "PINPadInoperative";
	PINSupported = "PINSupported";
	PINVerifiedByDevice = "PINVerifiedByDevice";
	Unknown = "Unknown";
end


class PINDebitUndoReason
	CADFailure = "CADFailure";
	CustomerCancellation = "CustomerCancellation";
	LateResponse = "LateResponse";
	NoResponse = "NoResponse";
	NotApplicable = "NotApplicable";
	NotSet = "NotSet";
	OriginalAmountIncorrect = "OriginalAmountIncorrect";
	PartiallyCompleted = "PartiallyCompleted";
	ResponseIncomplete = "ResponseIncomplete";
	ResponseTimeout = "ResponseTimeout";
	SuspectMalfunction = "SuspectMalfunction";
	UnableToDeliverResponse = "UnableToDeliverResponse";
	UnableToDeliverToPOS = "UnableToDeliverToPOS";
end


class PostalCodeResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class ReadCapability
	ARUIVR = "ARUIVR";
	BarCodeReader = "BarCodeReader";
	Chip = "Chip";
	ContactlessChip = "ContactlessChip";
	ContactlessMSR = "ContactlessMSR";
	ECR = "ECR";
	EmvICC = "EmvICC";
	HasMSR = "HasMSR";
	KeyOnly = "KeyOnly";
	MSREMVICC = "MSREMVICC";
	NFCCapable = "NFCCapable";
	NoMSR = "NoMSR";
	NoTerminal = "NoTerminal";
	NotSet = "NotSet";
	NotSpecified = "NotSpecified";
	OCRReader = "OCRReader";
	RFIDCapable = "RFIDCapable";
	Unknown = "Unknown";
	VSCCapable = "VSCCapable";
end


class RequestACI
	CPSMeritCapableIncAuth = "CPSMeritCapableIncAuth";
	IsCPSMeritCapable = "IsCPSMeritCapable";
	NotCPSMeritCapable = "NotCPSMeritCapable";
	NotSet = "NotSet";
	PremierCustomer = "PremierCustomer";
	RecurringInstallment = "RecurringInstallment";
end


class RequestAdvice
	Capable = "Capable";
	NotCapable = "NotCapable";
	NotSet = "NotSet";
end


class RequestCommercialCard
	Disable = "Disable";
	Enable = "Enable";
	NotSet = "NotSet";
end


class Resubmit
	NotPermitted = "NotPermitted";
	NotSet = "NotSet";
	Permitted = "Permitted";
	Unspecified = "Unspecified";
end


class ReturnedACI
	A = "A";
	C = "C";
	E = "E";
	F = "F";
	I = "I";
	K = "K";
	M = "M";
	N = "N";
	NotSet = "NotSet";
	NQ = "NQ";
	P = "P";
	R = "R";
	S = "S";
	T = "T";
	U = "U";
	V = "V";
	W = "W";
	Y = "Y";
end


class StateResult
	BadFormat = "BadFormat";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoMatch = "NoMatch";
	NoResponseFromCardAssociation = "NoResponseFromCardAssociation";
	NotIncluded = "NotIncluded";
	NotSet = "NotSet";
	NotVerified = "NotVerified";
	UnknownResponseFromCardAssociation = "UnknownResponseFromCardAssociation";
end


class TokenIndicator
	AttemptedCardUnsupported = "AttemptedCardUnsupported";
	AttemptedServiceUnavailable = "AttemptedServiceUnavailable";
	NotSet = "NotSet";
	UCAFWithData = "UCAFWithData";
	UCAFWithoutData = "UCAFWithoutData";
	VPAS = "VPAS";
end


class TypeCardType
	AmericanExpress = "AmericanExpress";
	CarteAurore = "CarteAurore";
	CartesBancaires = "CartesBancaires";
	CitibankFinancial = "CitibankFinancial";
	Dankort = "Dankort";
	DinersCartBlanche = "DinersCartBlanche";
	DinersClub = "DinersClub";
	Discover = "Discover";
	Electron = "Electron";
	Finax = "Finax";
	JCB = "JCB";
	Kopkort = "Kopkort";
	LaserCard = "LaserCard";
	Maestro = "Maestro";
	MasterCard = "MasterCard";
	NotSet = "NotSet";
	PrivateLabel = "PrivateLabel";
	RevolutionCard = "RevolutionCard";
	Solo = "Solo";
	UnbrandedATM = "UnbrandedATM";
	Visa = "Visa";
end


class TypeTaxType
	CityTax = "CityTax";
	CountyParishTax = "CountyParishTax";
	CountyTax = "CountyTax";
	EnergyTax = "EnergyTax";
	EnvironmentalTax = "EnvironmentalTax";
	FederalTax = "FederalTax";
	GoodsServicesTax = "GoodsServicesTax";
	HarmonizedTax = "HarmonizedTax";
	LocalSalesTax = "LocalSalesTax";
	LuxuryTax = "LuxuryTax";
	MunicipalTax = "MunicipalTax";
	NotSet = "NotSet";
	OccupancyTax = "OccupancyTax";
	OtherTax = "OtherTax";
	QuebecSalesTax = "QuebecSalesTax";
	RoomTax = "RoomTax";
	StateLocalSalesTax = "StateLocalSalesTax";
	StateProvincialGoodsTax = "StateProvincialGoodsTax";
	StateProvincialTax = "StateProvincialTax";
	StateSalesTax = "StateSalesTax";
	Unknown = "Unknown";
	VAT = "VAT";
end



class CaptureState
	BatchSent = "BatchSent";
	BatchSentUndoPermitted = "BatchSentUndoPermitted";
	CannotCapture = "CannotCapture";
	Captured = "Captured";
	CaptureDeclined = "CaptureDeclined";
	CapturedUndoPermitted = "CapturedUndoPermitted";
	CaptureError = "CaptureError";
	CapturePending = "CapturePending";
	CapturePendingUndoPermitted = "CapturePendingUndoPermitted";
	CaptureUnknown = "CaptureUnknown";
	InProcess = "InProcess";
	NotSet = "NotSet";
	ReadyForCapture = "ReadyForCapture";
	UndoReported = "UndoReported";
end


class CVDataProvided
	CardholderStatesNotAvailable = "CardholderStatesNotAvailable";
	DeliberatelyBypass = "DeliberatelyBypass";
	NotSet = "NotSet";
	Provided = "Provided";
	ValueIllegible = "ValueIllegible";
end


class CVResult
	Invalid = "Invalid";
	IssuerNotCertified = "IssuerNotCertified";
	Match = "Match";
	NoCodePresent = "NoCodePresent";
	NoMatch = "NoMatch";
	NoResponse = "NoResponse";
	NotApplicable = "NotApplicable";
	NotProcessed = "NotProcessed";
	NotSet = "NotSet";
	ShouldHaveBeenPresent = "ShouldHaveBeenPresent";
end


class EntryMode
	Barcode = "Barcode";
	ChipReliable = "ChipReliable";
	ChipTrackDataFromRFID = "ChipTrackDataFromRFID";
	ChipUnreliable = "ChipUnreliable";
	ContactlessMChipOrSmartCard = "ContactlessMChipOrSmartCard";
	ContactlessStripe = "ContactlessStripe";
	Keyed = "Keyed";
	KeyedBadMagRead = "KeyedBadMagRead";
	MSRTrackDataFromRFID = "MSRTrackDataFromRFID";
	NFCCapable = "NFCCapable";
	NotSet = "NotSet";
	OCRReader = "OCRReader";
	TerminalNotUsed = "TerminalNotUsed";
	Track2DataFromMSR = "Track2DataFromMSR";
	TrackDataFromMSR = "TrackDataFromMSR";
	VSCCapable = "VSCCapable";
end


class IndustryType
	Ecommerce = "Ecommerce";
	MOTO = "MOTO";
	NotSet = "NotSet";
	Restaurant = "Restaurant";
	Retail = "Retail";
end


class Status
	Failure = "Failure";
	NotSet = "NotSet";
	Successful = "Successful";
end


class TenderType
	Credit = "Credit";
	NotSet = "NotSet";
	PINDebit = "PINDebit";
end


class TransactionState
	Adjusted = "Adjusted";
	Authorized = "Authorized";
	Captured = "Captured";
	CaptureDeclined = "CaptureDeclined";
	Declined = "Declined";
	ErrorConnecting = "ErrorConnecting";
	ErrorUnknown = "ErrorUnknown";
	ErrorValidation = "ErrorValidation";
	InProcess = "InProcess";
	NotSet = "NotSet";
	PartiallyCaptured = "PartiallyCaptured";
	PartiallyReturned = "PartiallyReturned";
	PartialReturnRequested = "PartialReturnRequested";
	Returned = "Returned";
	ReturnRequested = "ReturnRequested";
	ReturnUndone = "ReturnUndone";
	Undone = "Undone";
	Verified = "Verified";
end


class BatchAssignmentSupport
	NotSet = "NotSet";
	NotSupported = "NotSupported";
	Supported = "Supported";
	SupportedWithCaptureAll = "SupportedWithCaptureAll";
end


class CloseBatch
	NotSet = "NotSet";
	NotSupported = "NotSupported";
	Required = "Required";
	Supported = "Supported";
end


class CreditAuthorizeSupportType
	AuthorizeAndCaptureOnly = "AuthorizeAndCaptureOnly";
	AuthorizeOnly = "AuthorizeOnly";
	Both = "Both";
end


class CreditReturnSupportType
	Both = "Both";
	Linked = "Linked";
	Standalone = "Standalone";
	Unsupported = "Unsupported";
end


class CreditReversalSupportType
	Both = "Both";
	Captured = "Captured";
	NotSupported = "NotSupported";
	ReadyForCapture = "ReadyForCapture";
end


class EncryptionType
	IPADV1Compatible = "IPADV1Compatible";
	MagneSafeV4V5Compatible = "MagneSafeV4V5Compatible";
	NotSet = "NotSet";
end


class PINDebitReturnSupportType
	Both = "Both";
	Linked = "Linked";
	Standalone = "Standalone";
	Unsupported = "Unsupported";
end


class PinDebitUndoSupportType
	NotSupported = "NotSupported";
	Supported = "Supported";
end


class PurchaseCardLevel
	Level1 = "Level1";
	Level2 = "Level2";
	Level3 = "Level3";
	NotSet = "NotSet";
end


class QueryRejectedSupportType
	NotSupported = "NotSupported";
	SupportedWithDateRange = "SupportedWithDateRange";
	SupportedWithSpecificDate = "SupportedWithSpecificDate";
end


class TrackDataSupportType
	Both = "Both";
	NotSet = "NotSet";
	NotSupported = "NotSupported";
	Track1 = "Track1";
	Track2 = "Track2";
end

class CardType
    NotSet = "NotSet";
    PrivateLabel = "PrivateLabel";
    Visa = "Visa";
    MasterCard = "MasterCard";
    AmericanExpress = "AmericanExpress";
    DinersCartBlanche = "DinersCartBlanche";
    Discover = "Discover";
    JCB = "JCB";
    CitibankFinancial = "CitibankFinancial";
    RevolutionCard = "RevolutionCard";
    UnbrandedATM = "UnbrandedATM";
end


class TypeISOLanguageCodeA3
    ENG = "ENG";
end


class TypeISOCurrencyCodeA3
	NotSet = "NotSet";
	USD = "USD";		# US Dollar
	CAD = "CAD";		# Canadian Dollar
	MXN = "MXN";	# Mexican Peso
	EUR = "EUR";		# Euro
end

class ISOCountryCodeA3
	NotSet = "NotSet";
	USA = "USA";	# USA
	CAN = "CAN";		# Canada
	MEX = "MEX";	# Mexico
end


class ErrorType
	Validation = "Validation";
	Processing = "Processing";
	System = "System";
end

end
