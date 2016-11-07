//
//  TypeProduct.h
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
#import "Product.h"

@interface TypeProduct : NSObject

@property (nonatomic,strong) NSString* typeProductId;
@property (nonatomic,strong) NSString* typeProductName;
@property (nonatomic,strong) NSArray* productArray;
+(DCKeyValueObjectMapping*) getParser;
@end
