//
//  CWSAlternativeMerchantData.h
//  gizmosdk
//
//  Created by Einar Vollset on 5/28/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CWSAddressInfo;

@interface CWSAlternativeMerchantData : NSObject
{
   
}

@property (nonatomic, strong) NSString *customerServicePhone;
@property (nonatomic, strong) NSString *customerServiceInternet;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *SIC;
@property (nonatomic, strong) NSString *merchantId;
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) CWSAddressInfo *address;

@end
