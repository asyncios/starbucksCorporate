//
//  TypeItem.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DCKeyValueObjectMapping/DCKeyValueObjectMapping.h>
#import <DCKeyValueObjectMapping/DCObjectMapping.h>
#import <DCKeyValueObjectMapping/DCParserConfiguration.h>
#import <DCKeyValueObjectMapping/DCArrayMapping.h>

@interface TypeItem : NSObject

@property (nonatomic,strong) NSString* typeItemId;
@property (nonatomic,strong) NSString* typeItemName;
+(DCKeyValueObjectMapping*) getParser;
@end
