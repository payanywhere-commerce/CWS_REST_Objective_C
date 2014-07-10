/* Copyright (c) 2014 North American Bancard, LLC - All Rights Reserved.
 *
 * This software and documentation is subject to and made
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

//  Created by Zebulon Bowles on 7/9/14.
//
//  AppDelegate.m
//

#import "AppDelegate.h"
#import "CWSAPI.h"
#import "CWSTransactionData.h"
#import "CWSTransactionDataPro.h"
#import "CWSCreditCard.h"
#import "CWSTransactionReportingData.h"
#import "CWSAlternativeMerchantData.h"
#import "NSDate+InternetDateTime.h"
#import "FirstViewController.h"

#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        
    NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSDictionary *config = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    BOOL *sendEncryptedTransaction = FALSE;
    BOOL *sendKeyedTransaction = FALSE;

    
    /* credit card */
    CWSCreditCard *keyedCreditCard = [[CWSCreditCard alloc] init];
    keyedCreditCard.type = @"MasterCard";
    keyedCreditCard.name = @"Chuck Check";
    keyedCreditCard.number = @"4111111111111111";
    keyedCreditCard.expiration = @"1212";
    keyedCreditCard.track1 = nil;
    keyedCreditCard.track2 = nil;
    keyedCreditCard.address = @"1000 1st Av";
    keyedCreditCard.city = @"Denver";
    keyedCreditCard.state = @"CO";
    keyedCreditCard.zip = @"10101";
    keyedCreditCard.country = @"USA";
    keyedCreditCard.phone = nil;//nil
    keyedCreditCard.cvv = nil;//nil
    
    /* credit card */
    CWSCreditCard *swipedCreditCard = [[CWSCreditCard alloc] init];
    swipedCreditCard.type = @"Visa";
    swipedCreditCard.name = nil;
    swipedCreditCard.number = @"4111111111111111";
    swipedCreditCard.expiration = @"1015";
    swipedCreditCard.track1 = nil;
    swipedCreditCard.track2 = @"4012000033330026=09041011000012345678";
    swipedCreditCard.address = nil;
    swipedCreditCard.city = nil;
    swipedCreditCard.state = nil;
    swipedCreditCard.zip = nil;
    swipedCreditCard.country = nil;
    swipedCreditCard.phone = nil;//nil
    swipedCreditCard.cvv = nil;//nil
    
    /* credit card */
    CWSCreditCard *encryptedCreditCard = [[CWSCreditCard alloc] init];
    encryptedCreditCard.type = nil;
    encryptedCreditCard.name = nil;
    encryptedCreditCard.number = nil;
    encryptedCreditCard.expiration = nil;
    encryptedCreditCard.track1 = nil;
    encryptedCreditCard.track2 = nil;
    encryptedCreditCard.address = nil;
    encryptedCreditCard.city = nil;
    encryptedCreditCard.state = nil;
    encryptedCreditCard.zip = nil;
    encryptedCreditCard.country = nil;
    encryptedCreditCard.phone = nil;//nil
    encryptedCreditCard.cvv = nil;//nil]
    encryptedCreditCard.encryptionKeyId = @"9010010B0C2472000021"; //20-character string returned by MagneSafe device when card is swiped.
    encryptedCreditCard.securePaymentAccountData = @"87936F09AE06386BA4CD81ADFF7DF0FA5AC1B28EF9F7B7075E415545F9B9095C0AC5FA12B9905325"; //Encrypted Track 2 data returned by MagneSafe device when card is swiped.
    encryptedCreditCard.identificationInformation = @"9ED72A486AB36DC352957C2C00607E937D1D90CB8B09A8588629AABA8EAF0FD65296A4FBA490EECFCD8D5B350438C4BFA6A36FFA2ADAAA3E"; //Encrypted MagnePrintÆ Information returned by the MagneSafeô device when card is swiped.
    encryptedCreditCard.swipeStatus = @"00304061"; //MagnePrint Status of Card Swipe. This is an alpha numeric string, returned by MagneSafe device when card is swiped.
    encryptedCreditCard.deviceSerialNumber = @"344789399";  // Device Serial Number of the MagTek device

    /* transaction data */
    CWSTransactionData *transactionData = [[CWSTransactionData alloc] init];
    /* For authorize */
    transactionData.accountType = @"BankcardTransactionDataPro,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard/Pro";
    /* For Return Unlinked */
    transactionData.accountType = @"BankcardTransactionData,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard";
    transactionData.accountType = nil;
    transactionData.approvalCode = nil;//nil
    transactionData.cashBackAmount = nil;//nil
    transactionData.currencyCode = @"USD";
    transactionData.customerPresent = @"Present";
    transactionData.employeeId = @"1";
    transactionData.entryMode = @"Keyed";
    transactionData.goodsType = @"";//nil
    transactionData.laneId = @"1";
    transactionData.industryType = @"Retail";
    transactionData.invoiceNumber = nil;//nil/// CHECK
    transactionData.orderNumber = @"811361435232325";
    transactionData.signatureCaptured = false;
    transactionData.tipAmount = [NSNumber numberWithInt:0];
    transactionData.amount = [NSNumber numberWithDouble:28.00];
    transactionData.CFeeAmount = nil;//nil
    transactionData.dateTime = [NSDate dateFromRFC3339String:@"2012-03-26T09:44:43.125-04:00"];
    transactionData.reportingData = nil;
    transactionData.altMerchantData = nil;
    transactionData.reference = @"1122432";  // Should be unique
    transactionData.transactionCode = @"NotSet";  // Only used to force a duplicate transaction through the system, set to "Override" to force transaction through.
    
    /*
     *  Some providers require merchant specific credentials to be passed in the addendum
     *  the below code demonstrates how to set those credentials
     */
   /*
    NSString *username = @"<Username>";
    username = [username stringByAppendingString:[config valueForKeyPath:@"providerUsername"]];
    username = [username stringByAppendingString:@"</Username>"];
    NSString *password = @"<Password>";
    password = [password stringByAppendingString:[config valueForKeyPath:@"providerPassword"]];
    password = [password stringByAppendingString:@"</Password>"];
    
    NSArray *creds;
    creds = [NSArray arrayWithObjects:username, password, nil];
    transactionData.creds = creds;
    
    *
     * Initialize the CWS API 
     */
    
    NSError *error = nil;
    CWSAPI *api;

    if ([[config valueForKeyPath:@"activationKey"] isEqualToString:@""]) {
        api = [CWSAPI sharedAPIWithIdentityToken:[config valueForKeyPath:@"identityToken"] andBaseURL:[config valueForKeyPath:@"baseURL"] andMerchantProfileId:[config valueForKeyPath:@"merchantProfileId"] andServiceId:[config valueForKeyPath:@"serviceId"] andWorkflowId:[config valueForKeyPath:@"workflowId"] andApplicationProfileId:[config valueForKeyPath:@"applicationProfileId"] error:&error];
    }
    else {
        api = [CWSAPI sharedAPIWithIdentityToken:[config valueForKeyPath:@"identityToken"] andBaseURL:[config valueForKeyPath:@"baseURL"] andMerchantProfileId:[config valueForKeyPath:@"activationKey"] andServiceId:[config valueForKeyPath:@"serviceId"] andWorkflowId:[config valueForKeyPath:@"workflowId"] andApplicationProfileId:[config valueForKeyPath:@"applicationProfileId"] error:&error];
    }

    
    /*
     *  GetServiceInformation and Supported Operations
     */
    
    NSLog(@"Service Information: \n%@", [api getServiceInformation]);
    NSArray *supportedOperations = [[NSArray alloc] init];
    supportedOperations = [api getSupportedOperations];
    NSLog(@"Supported Operations: \n%@", supportedOperations);
    
    /*
     *  Create credit card object and assign to various supported Tenders
     */
    
    CWSCreditCard *creditCard = [[CWSCreditCard alloc] init];
    
    if (sendEncryptedTransaction && !sendKeyedTransaction)
    {
        creditCard = encryptedCreditCard;
        transactionData.entryMode = @"Track2DataFromMSR";
    }
    else if (!sendEncryptedTransaction && !sendKeyedTransaction)
    {
        creditCard = swipedCreditCard;
        transactionData.entryMode = @"Track2DataFromMSR";
    }
    else
    {
        creditCard = keyedCreditCard;
        transactionData.entryMode = @"Keyed";
    }
    
    
    /* 
     *  Authorize and Capture seperately
     */
    
    NSError **authorizeError = nil;
    NSError **captureError = nil;
    NSString *transactionID = nil;
    NSDictionary *authorizationResponse;
    NSDictionary *capturedTransaction;
    
    if([supportedOperations containsObject: @"Authorize"])
    {
        authorizationResponse= [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
        NSLog(@"Authorization completed");
        transactionID = authorizationResponse[@"TransactionId"];
    }
   
    
    if (transactionID && [supportedOperations containsObject: @"Capture"])
    {
        // TODO: capture does not support "DifferenceData" as mentioned on https://my.evosnap.com/Docs/TransactionProcessing/CWS/API_Reference/2.0.18/RESTDataElements/Rest.Capture.aspx
         capturedTransaction = [api captureTransactionWithId:transactionID forAmount:transactionData.amount andTipAmount:transactionData.tipAmount andCreds:transactionData.creds withTag:nil error:captureError];
    }
    
    
    /* 
     *  AuthorizeAndCapture as one transaction type
     *  below code shows sending a Keyed, Swiped, and Encrypted swipe transaction
     */
    
    if([supportedOperations containsObject: @"AuthAndCapture"])
    {
        NSError **authorizeNCaptureError = NULL;
        NSDictionary *authorizeNCaptureDict = [api authorizeAndCaptureTransaction:transactionData withCreditCard:creditCard error:authorizeNCaptureError];
        
        if(sendEncryptedTransaction){
        creditCard = encryptedCreditCard;
        transactionData.entryMode = @"Track2DataFromMSR";
        authorizeNCaptureDict = [api authorizeAndCaptureTransaction:transactionData withCreditCard:creditCard error:authorizeNCaptureError];
        }
        
        creditCard = swipedCreditCard;
        transactionData.entryMode = @"Track2DataFromMSR";
        authorizeNCaptureDict = [api authorizeAndCaptureTransaction:transactionData withCreditCard:creditCard error:authorizeNCaptureError];
    }
    
    /* 
     *  Authorize and Adjust
     */
    
    if([supportedOperations containsObject: @"Authorize"] && [supportedOperations containsObject: @"Adjust"])
    {
        NSError **authorizeError = nil;
        NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
        NSLog(@"Authorization completed: \n%@",authorizationResponse);
        NSString *transactionID = authorizationResponse[@"TransactionId"];
        CWSDifferenceData *differenceData = [[CWSDifferenceData alloc] init];
        differenceData.amount = [NSNumber numberWithDouble:2.00];
        differenceData.tipAmount = [NSNumber numberWithDouble:1.00];
        differenceData.transactionID = transactionID;
        NSError **adjustError = nil;
        NSDictionary *adjustResponse = [api adjustTransactionWithId:transactionID withDifferenceData:differenceData withTag:nil error:adjustError];
        NSLog(@"Adjust completed: \n%@",adjustResponse);
    }
    
    
    /* 
     *  Authorize and Undo
     */
    
    if([supportedOperations containsObject: @"Authorize"] && [supportedOperations containsObject: @"Undo"])
    {
        NSError **authoriseError = nil;
        NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authoriseError];
        NSString *transactionID = authorizationResponse[@"TransactionId"];
        NSError **undoError = nil;
        NSDictionary *undoResponse = [api undoTransactionWithId:transactionID andCreds:transactionData.creds withTag:nil error:undoError];
        NSLog(@"Undo completed: \n%@",undoResponse);
    }
    
     
    /* 
     *  AuthorizeAndCapture and Return by ID
     */
    
    if([supportedOperations containsObject: @"AuthAndCapture"] && [supportedOperations containsObject: @"ReturnById"])
    {   
        NSError **authorizeNCaptureError = nil;
        NSDictionary *authorizeNCaptureDict = [api authorizeAndCaptureTransaction:transactionData withCreditCard:creditCard error:authorizeNCaptureError];
        NSString *transactionID = authorizeNCaptureDict[@"TransactionId"];
        NSError **returnByIDError = nil;
        NSDictionary *returnTransaction = [api returnTransactionWithId:transactionID forAmount:[NSNumber numberWithDouble:0.0]  andCreds:transactionData.creds withTag:nil error:returnByIDError];
        NSLog(@"ReturnById completed: \n%@",returnTransaction);
    }

    /* Return Unlinked */
    
    if([supportedOperations containsObject: @"ReturnUnlinked"] )
    {
        NSError **returnUnlinkedError = nil;
        NSDictionary *returnUnlinkeResponse = [api returnUnlinkedTransaction:transactionData withCreditCard:creditCard error:returnUnlinkedError];
        NSLog(@"ReturnUnlinked completed: \n%@",returnUnlinkeResponse);
    }
    
    
    /* Authorize, capture selectively and batch query */
    if([supportedOperations containsObject: @"Authorize"] && [supportedOperations containsObject: @"CaptureSelective"])
    {
        
        NSError **authorizeError = nil;
        NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
        NSString *transactionID = authorizationResponse[@"TransactionId"];
        
        NSError **captureSelectiveError = nil;
        CWSDifferenceData *differenceData = [[CWSDifferenceData alloc] init];
        differenceData.amount = [NSNumber numberWithDouble:2.00];
        differenceData.tipAmount = [NSNumber numberWithDouble:1.00];
        differenceData.transactionID = transactionID;
        NSArray *transactionIDs = [NSArray arrayWithObject:transactionID];
        NSArray *differenceDatas = [NSArray arrayWithObject:differenceData];
        NSDictionary *captureSelective = [api captureSelectiveTransactionsWithIds:transactionIDs withDifferenceData:differenceDatas withTag:nil error:captureSelectiveError];
        NSLog(@"CaptureSelective completed: \n%@",captureSelective);
        NSError **queryError = nil;
        NSArray *queryBatch = [api queryBatchWithTransactionIds:[NSArray arrayWithObject:transactionID] error:queryError];
        NSLog(@"QueryBatch completed: \n%@",queryBatch);
        
    }
    
    /* Authorize and capture all */
    if([supportedOperations containsObject: @"Authorize"] && [supportedOperations containsObject: @"CaptureAll"])
    {   
        NSError **authorizeError = nil;
        NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
        NSString *transactionID = authorizationResponse[@"TransactionId"];
        
        NSError **captureAllError = nil;
        CWSDifferenceData *differenceData = [[CWSDifferenceData alloc] init];
        differenceData.amount = [NSNumber numberWithDouble:2.00];
        differenceData.tipAmount = [NSNumber numberWithDouble:1.00];
        differenceData.transactionID = transactionID;
        NSArray *differenceDatas = [NSArray arrayWithObject:differenceData];
        NSDictionary *captureAll = [api captureAllTransactionsWithDifferenceData:differenceDatas withTag:nil error:captureAllError];
        NSLog(@"CaptureAll completed: \n%@",captureAll);
    }
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    UIViewController *viewController2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}
@end