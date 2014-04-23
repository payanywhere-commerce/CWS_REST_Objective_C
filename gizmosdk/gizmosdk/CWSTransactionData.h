//
//  CWSTransactionData.h
//  gizmosdk
//
//  Created by Einar Vollset on 3/23/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWSTransactionReportingData;
@class CWSAlternativeMerchantData;

@interface CWSTransactionData : NSObject
{
}

@property (nonatomic, strong) NSString *invoiceNumber;
@property (nonatomic, strong) NSString *orderNumber;
@property (nonatomic, strong) NSString *customerPresent;
@property (nonatomic, strong) NSString *employeeId;
@property (nonatomic, strong) NSString *entryMode;
@property (nonatomic, strong) NSString *goodsType;
@property (nonatomic, strong) NSString *laneId;
@property (nonatomic, strong) NSString *industryType;
@property (nonatomic, strong) NSString *accountType;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSNumber *CFeeAmount;
@property (nonatomic, strong) NSNumber *cashBackAmount;
@property (nonatomic, strong) NSString *currencyCode;
@property (nonatomic, getter=isSignatureCaptured) BOOL signatureCaptured;
@property (nonatomic, strong) NSNumber *tipAmount;
@property (nonatomic, strong) NSString *approvalCode;
@property (nonatomic, strong) NSString *creds;
@property (nonatomic, strong) NSDate *dateTime;
@property (nonatomic, strong) CWSTransactionReportingData *reportingData;
@property (nonatomic, strong) CWSAlternativeMerchantData *altMerchantData;

@end
