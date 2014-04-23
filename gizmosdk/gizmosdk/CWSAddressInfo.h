//
//  CWSAddressInfo.h
//  gizmosdk
//
//  Created by Einar Vollset on 5/28/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWSAddressInfo : NSObject
{
   
}

@property (nonatomic, strong) NSString *street1;
@property (nonatomic, strong) NSString *street2;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *stateProvince;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *countryCode;

@end
