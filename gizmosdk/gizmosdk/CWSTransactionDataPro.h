//
//  CWSTransactionDataPro.h
//  gizmosdk
//
//  Created by Einar Vollset on 3/23/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWSTransactionData.h"

@class CWSInterchangeData;

@interface CWSTransactionDataPro : CWSTransactionData
{
   
}

@property (nonatomic, strong) CWSInterchangeData *interchangeData;


@end
