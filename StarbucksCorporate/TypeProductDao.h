//
//  TypeProductDao.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TypeProduct.h"

@interface TypeProductDao : NSObject

+ (TypeProductDao*)sharedInstance;
-(NSArray*) getTypeProductArray;
@end
