s software and documentation is subject to and made
 * available only pursuant to the terms of an executed license
 * agreement, and may be used only in accordance with the terms
 * of said agreement. This software may not, in whole or in part,
 * be copied, photocopied, reproduced, translated, or reduced to
 * any electronic medium or machine-readable form without
 * prior consent, in writing, from North American Bancard
 *
 * Use, duplication or disclosure by the U.S. Government is subject
 * to restrictions set forth in an executed license agreement
 * and in subparagraph (c)(1) of the Commercial Computer
 * Software-Restricted Rights Clause at FAR 52.227-19; subparagraph
 * (c)(1)(ii) of the Rights in Technical Data and Computer Software
 * clause at DFARS 252.227-7013, subparagraph (d) of the Commercial
 * Computer Software--Licensing clause at NASA FAR supplement
 * 16-52.227-86; or their equivalent.
 *
 * Information in this software is subject to change without notice
 * and does not represent a commitment on the part of North American Bancard, LLC.
 *
 * Sample Code is for reference Only and is intended to be used for educational purposes. It's the responsibility of
 * the software company to properly integrate into their solution code that best meets their production needs.
 */


NOTE: You will need to obtain an IdentityToken from your Customer Support Specialist in order to perform your certification.

Step 1:  In the config.plist file enter the IdentityToken, ApplicationProfileId, ServiceId, WorkflowId, and MerchantProfileId given to you.  The defaults in the AppDelegate.m are set to Retail Card Present with MagTek, see the below for what the defaults should be depending on industry.

Step 2:  Run the Xcode project and view the console output for transaction requests and responses.

Step 3:  You will want to directly import the SDK folder into your project and use the AppDelegate files as a template to interface with your application.

											
Industry: Retail
	TxnData_IndustryType = 'Retail'
	TxnData_CustomerPresent = 'Present'
	ApplicationAttended = true;
	ApplicationLocation = 'OnPremises'
	PINCapability = 'PINNotSupported'
	ReadCapability = 'HasMSR'
	EntryMode = 'TrackDataFromMSR'
											
Industry: Restaurant
	TxnData_IndustryType = 'Restaurant'
	TxnData_CustomerPresent = 'Present'
	ApplicationAttended = true;
	ApplicationLocation = 'OnPremises'
	PINCapability = 'PINNotSupported'
	ReadCapability = 'HasMSR'
	EntryMode = 'TrackDataFromMSR'

