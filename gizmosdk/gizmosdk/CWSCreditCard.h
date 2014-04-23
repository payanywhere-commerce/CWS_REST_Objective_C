//
//  CWSCreditCard.h
//  gizmosdk
//
//  Created by Einar Vollset on 3/23/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWSCreditCard : NSObject
{
	    
}

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *expiration;
@property (nonatomic, strong) NSString *cvv;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSString *track1;
@property (nonatomic, strong) NSString *track2;

@end
