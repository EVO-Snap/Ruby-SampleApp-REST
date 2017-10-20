![Snap* API 2.1.28](https://img.shields.io/badge/Snap*%20API-2.1.28-blue.svg) ![Release Version](https://img.shields.io/github/release/EVO-Snap/Ruby-SampleApp-REST-CardNotPresent.svg) ![Rubocop: No Violations!](https://img.shields.io/badge/Rubocop-No%20Violations!-brightgreen.svg)

# EVO Snap* Ruby Card Not Present Rest Sample Application

This application is sample code demonstrating how to integrate with Evo Snap*'s
Commerce Web Services via our REST interface.

**Got a question?**  Visit http://www.evosnap.com/support/ for development help.  

Integration Guidelines available here:  http://www.evosnap.com/support/knowledgebase/

To request personalized test credentials visit: http://www.evosnap.com/request-certification-credentials/

## Talk to your Solutions Consultant before attempting to run this software.

This software depends on contacting the Snap* Commerce Web Services API for all
functionality, so you will need to obtain an IdentityToken from your Snap*
Solutions Consultant in order to run this project successfully.

This project was created on Ruby 2.3.3 and makes direct calls to the Snap* API
via the built in Net::HTTP library.  It only uses built in packages.

### Set Up

You'll need to edit config.rb once you've got your identity information from
your Solutions Consultant.

1. Place your Idenitity details into the IdentityToken string.
2. Update the details in the "Merchant Profile Information" to match those
   provided by your Solutions Consultant.  See the "*Example Industry
	 Configuration Details*" section for example configurations.
3. If your Solutions Consultant provided you with a Workflow, you'll want to set
   UseWorkflow to "true" and provide the proper Workflow ID in the configuration
	 as well.
4. You can use this sample code as a base for your real application, utilizing
   the provided helpers and include files to make the appropriate API calls.  If
	 you do so, you will want to update the data in the "Application Data Values"
	 section of the configuration file.
5. If you use a proxy application, like Charles Proxy, to intercept API calls
   for debugging, or if your internet connection requires a proxy step, you'll
	 want to configure the Proxy section to point to your proxy.
6. The application defaults to Ecommerce Card Not Present configurations for the
   Demo  Mode.  If your actual industry type is different, you will need to
   configure the application accordingly.  You can reach out to your Solutions
   Consultant if you require assistance with this step.

### Note: Production Use

This application is a great starting point for developing your own application
integration with Snap*.  However, due to the way SSL/TLS works debugging
proxies, you may need to disable SSL/TLS Certificate Validation.

This, naturally, is a very bad thing for production use with production
credentials, but it's fine for development.  To disable certificate validation,
you'll want to set "NoCertVerify" in your configuration file to "true."

If you set this value to "false" certificate validation will be done.

## Using The Application

Once configured, the application is very easy to use.  Simply run "main.rb" on
the command line with your ruby interpreter.  (We recommend jruby for speed).
The application runs through a series of setup steps to prepare your application
to transact with the Snap* platform, followed by three workflows:

1. The *host_capture* workflow emulates the workflow followed when transactions
   are batched on the host for capture.
2. The *terminal_capture* workflow emulates the workflow where transactions are
   batched at the terminal for capture.
3. The *tms* workflow demonstrates Snap*'s Transaction Management Service, which
   stores your historical transaction details securely in the cloud.  TMS
	 provides you with a simple query-and-fetch API you can use to pull the
	 transaction details directly from our service without having to store and
	 share them locally.

Host Capture and Terminal Capture support different api calls;  the specific API
calls you can make depend on your Service ID;  the get_service_info call in
ApplicationAndMerchantSetup/3_get_service_information.rb will provide you with
a hash containing the "Operations" key which show which operations are valid for
your workflow and service configuration.

## Understanding The Application

Applications utilizing the Snap* platform follow a series of steps:

* Connection Setup
  - Fetch a Session Token based on the Identity Token
	- Optional:  Cache the Session Token for use by future commands
* Application Setup
  - Fetch Application Profile
	- Fetch Service Information
	- Fetch Merchant Profile
* Optional:  make a series of transactions
* Optional:  make a series of queries to TMS

Snap*'s Commerce Web Services can utilize either SOAP or REST.  This sample
application uses CWS' RESTful implementation.  As such, the "Connection Setup"
step fetches a Session Token which is then attached to the HTTP-Authorization
header in all future API calls.

> For more information about how this application handles the HTTPS connection,
> you'll want to look at client_api.rb in the main directory and
> Helpers/simple_response.rb, which shows how this sample application handles
> the JSON returned by the RESTful API.
>
> client_api.rb provides two very useful (low level) methods:
>   - sign_on(identity_token):
>     - This method takes an identity_token and creates a session token for use
>       in future API calls.  The send method will automatically refresh the
>       session token as required.
>   - send(path, body, rest_action, url)
>     - This method is the meat-and-potatoes method call in this application.
>       It takes the path defined in our API documentation, the body of a
>       request, the name of the REST action, and the URL to direct the call to.
>
> Please note that these are very low level calls;  the magic actually takes
> place in the main library files:
> - TransactionManagementServices/txn_management_services.rb
> - TransactionProcessing/endpoint_txn.rb

## Example Industry Configuration Details

* Ecommerce
  - TxnData_IndustryType = 'Ecommerce'
  - TxnData_CustomerPresent = 'Ecommerce'
  - ApplicationAttended = false;
  - ApplicationLocation = 'OffPremises'
  - PINCapability = 'PINNotSupported'
  - ReadCapability = 'KeyOnly'
  - EntryMode = 'Keyed'

* MOTO (Mail Order-Telephone Order)
  - TxnData_IndustryType = 'MOTO'
  - TxnData_CustomerPresent = 'MOTO'
  - ApplicationAttended = false;
  - ApplicationLocation = 'OffPremises'
  - PINCapability = 'PINNotSupported'
  - ReadCapability = 'KeyOnly'
  - EntryMode = 'Keyed'

* Retail
  - TxnData_IndustryType = 'Retail'
  - TxnData_CustomerPresent = 'Present'
  - ApplicationAttended = true;
  - ApplicationLocation = 'OnPremises'
  - PINCapability = 'PINNotSupported'
  - ReadCapability = 'HasMSR'
  - EntryMode = 'TrackDataFromMSR'

* Restaurant
  - TxnData_IndustryType = 'Restaurant'
  - TxnData_CustomerPresent = 'Present'
  - ApplicationAttended = true;
  - ApplicationLocation = 'OffPremises'
  - PINCapability = 'PINNotSupported'
  - ReadCapability = 'HasMSR'
  - EntryMode = 'TrackDataFromMSR'

## License

 This software and documentation is subject to and made
 available only pursuant to the terms of an executed license
 agreement, and may be used only in accordance with the terms
 of said agreement. This software may not, in whole or in part,
 be copied, photocopied, reproduced, translated, or reduced to
 any electronic medium or machine-readable form without
 prior consent, in writing, from EVO Payments International, INC.

 Use, duplication or disclosure by the U.S. Government is subject
 to restrictions set forth in an executed license agreement
 and in subparagraph (c)(1) of the Commercial Computer
 Software-Restricted Rights Clause at FAR 52.227-19; subparagraph
 (c)(1)(ii) of the Rights in Technical Data and Computer Software
 clause at DFARS 252.227-7013, subparagraph (d) of the Commercial
 Computer Software--Licensing clause at NASA FAR supplement
 16-52.227-86; or their equivalent.

 Information in this software is subject to change without notice
 and does not represent a commitment on the part of EVO Payments International.

 Sample Code is for reference Only and is intended to be used for educational
 purposes. It's the responsibility of the software company to properly
 integrate into thier solution code that best meets thier production needs.

 - Copyright:: 2017 EVO Payments International - All Rights Reserved
 - License:: Proprietary
