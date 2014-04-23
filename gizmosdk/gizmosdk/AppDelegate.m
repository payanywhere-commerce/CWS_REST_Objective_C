//
//  AppDelegate.m
//  gizmosdk
//
//  Created by Einar Vollset on 3/19/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
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
    /* authentication credentials */
    NSString *hostCaptureIdentityToken = @"";
    
    /* Host Capture */
    /*
    NSString *hostCaptureServiceId = @"";
    NSString *hostCaptureApplicationProfileId = @"";
    NSString *hostCaptureMerchantProfileId = @"";
    */
    
    /* Terminal Capture */
    NSString *hostCaptureServiceId = @"";
    NSString *hostCaptureApplicationProfileId = @"";
    NSString *hostCaptureMerchantProfileId = @"";
    
    /* Terminal Capture */
    
     NSString *hostCaptureServiceId = @"";
     NSString *hostCaptureApplicationProfileId = @"";
     NSString *hostCaptureMerchantProfileId = @"";
     */

    
    /* credit card */
    CWSCreditCard *creditCard = [[CWSCreditCard alloc] init];
    creditCard.type = @"MasterCard";
    creditCard.name = @"Chuck Check";
    creditCard.number = @"5480020605154711";
    creditCard.expiration = @"1212";
    creditCard.track1 = nil;
    creditCard.track2 = nil;
    creditCard.address = @"1000 1st Av";
    creditCard.city = @"Denver";
    creditCard.state = @"CO";
    creditCard.zip = @"10101";
    creditCard.country = @"USA";
    creditCard.phone = nil;//nil
    creditCard.cvv = nil;//nil

    /* transaction data */
    CWSTransactionData *transactionData = [[CWSTransactionData alloc] init];
    /* For authorize */
    transactionData.accountType = @"BankcardTransactionDataPro,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard/Pro";
    /* For Return Unlinked */
    //transactionData.accountType = @"BankcardTransactionData,http://schemas.ipcommerce.com/CWS/v2.0/Transactions/Bankcard";
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
    transactionData.creds = nil;//nil
    transactionData.dateTime = [NSDate dateFromRFC3339String:@"2012-03-26T09:44:43.125-04:00"];
    transactionData.reportingData = nil;
    transactionData.altMerchantData = nil;
    
    NSError *error;
    
    CWSAPI *api = [CWSAPI sharedAPIWithIdentityToken:hostCaptureIdentityToken andMerchantProfileId:hostCaptureMerchantProfileId andServiceId:hostCaptureServiceId andApplicationProfileId:hostCaptureApplicationProfileId error:&error];
    
    NSLog(@"Service Information: \n%@", [api getServiceInformation]);
    NSLog(@"Supported Operations: \n%@", [api getSupportedOperations]);
    
    /* Authorize and capture seperately */
   /*
    NSError **authorizeError;
    NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
    NSLog(@"Authorization completed");
    NSString *transactionID = authorizationResponse[@"TransactionId"];
    
    if (transactionID)
    {
        NSError **captureError;
        
        // TODO: capture does not support "DifferenceData" as mentioned on https://my.ipcommerce.com/Docs/TransactionProcessing/CWS/API_Reference/2.0.18/RESTDataElements/Rest.Capture.aspx
        NSDictionary *capturedTransaction = [api captureTransactionWithId:transactionID forAmount:transactionData.amount andTipAmount:transactionData.tipAmount withTag:nil error:captureError];
    }
    */
    
    /* Authorize and Capture */
    /*
    NSError **authorizeNCaptureError;
    NSDictionary *authorizeNCaptureDict = [api authorizeAndCaptureTransaction:transactionData withCreditCard:creditCard error:authorizeNCaptureError];
     */
    
    /* Authorize and Adjust */
    /*
    NSError **authoriseError;
    NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authoriseError];
    NSLog(@"Authorization completed: \n%@",authorizationResponse);
    NSString *transactionID = authorizationResponse[@"TransactionId"];
    CWSDifferenceData *differenceData = [[CWSDifferenceData alloc] init];
    differenceData.amount = [NSNumber numberWithDouble:2.00];
    differenceData.tipAmount = [NSNumber numberWithDouble:1.00];
    differenceData.transactionID = transactionID;
    NSError **adjustError;
    NSDictionary *adjustResponse = [api adjustTransactionWithId:transactionID withDifferenceData:differenceData withTag:nil error:adjustError];
    */
    
    /* Authorize and Undo */
    /*
    NSError **authoriseError;
    NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authoriseError];
    NSString *transactionID = authorizationResponse[@"TransactionId"];
    NSError **undoError;
    NSDictionary *undoResponse = [api undoTransactionWithId:transactionID withTag:nil error:undoError];
    */
     
    /* Authorise and Return by ID */
    /*
    NSError **authorizeNCaptureError;
    NSDictionary *authorizeNCaptureDict = [api authorizeAndCaptureTransaction:transactionData withCreditCard:creditCard error:authorizeNCaptureError];
    NSString *transactionID = authorizeNCaptureDict[@"TransactionId"];
    NSError **returnByIDError;
    NSDictionary *returnTransaction = [api returnTransactionWithId:transactionID forAmount:[NSNumber numberWithDouble:0.0] withTag:nil error:returnByIDError];
    */

    /* Authorize and Return Unlinked */
    
    NSError **returnUnlinkedError;
    NSDictionary *returnUnlinkeResponse = [api returnUnlinkedTransaction:transactionData withCreditCard:creditCard error:returnUnlinkedError];
    
    
    /* Authorize, capture selectively and batch query */
    /*
    NSError **authorizeError;
    NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
    NSString *transactionID = authorizationResponse[@"TransactionId"];
    
    NSError **captureSelectiveError;
    CWSDifferenceData *differenceData = [[CWSDifferenceData alloc] init];
    differenceData.amount = [NSNumber numberWithDouble:2.00];
    differenceData.tipAmount = [NSNumber numberWithDouble:1.00];
    differenceData.transactionID = transactionID;
    NSArray *transactionIDs = [NSArray arrayWithObject:transactionID];
    NSArray *differenceDatas = [NSArray arrayWithObject:differenceData];
    NSDictionary *captureSelective = [api captureSelectiveTransactionsWithIds:transactionIDs withDifferenceData:differenceDatas withTag:nil error:captureSelectiveError];
    
    NSError **queryError;
    NSArray *queryBatch = [api queryBatchWithTransactionIds:[NSArray arrayWithObject:transactionID] error:queryError];
    */
    
    /* Authorize and capture all */
    /*
    NSError **authorizeError;
    NSDictionary *authorizationResponse = [api authorizeTransaction:transactionData withCreditCard:creditCard error:authorizeError];
    NSString *transactionID = authorizationResponse[@"TransactionId"];
    
    NSError **captureAllError;
    CWSDifferenceData *differenceData = [[CWSDifferenceData alloc] init];
    differenceData.amount = [NSNumber numberWithDouble:2.00];
    differenceData.tipAmount = [NSNumber numberWithDouble:1.00];
    differenceData.transactionID = transactionID;
    NSArray *differenceDatas = [NSArray arrayWithObject:differenceData];
    NSDictionary *captureAll = [api captureAllTransactionsWithDifferenceData:differenceDatas withTag:nil error:captureAllError];
    */
    
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
