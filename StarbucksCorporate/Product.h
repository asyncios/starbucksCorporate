//
//  Product.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DCKeyValueObjectMapping/DCKeyValueObjectMapping.h>
#import <DCKeyValueObjectMapping/DCObjectMapping.h>
#import <DCKeyValueObjectMapping/DCParserConfiguration.h>
#import <DCKeyValueObjectMapping/DCArrayMapping.h>
#import "Item.h"

@interface Product : NSObject

@property (nonatomic,strong) NSString* productId;
@property (nonatomic,strong) NSString* productName;
@property (nonatomic,strong) NSArray* itemArray;
+(DCKeyValueObjectMapping*) getParser;

@end
