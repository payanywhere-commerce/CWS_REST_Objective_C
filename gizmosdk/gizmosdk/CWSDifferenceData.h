//
//  CWSDifferenceData.h
//  gizmosdk
//
//  Created by Einar Vollset on 3/23/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWSDifferenceData : NSObject
{
   
}

@property (nonatomic, strong) NSString *transactionID;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSNumber *tipAmount;
@property (nonatomic, strong) NSDate *shipDate;
@property (nonatomic, strong) NSString *chargeType;
@property (nonatomic, strong) NSString *creds;

@end


