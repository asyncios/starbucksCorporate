//
//  Item.h
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

@interface Item : NSObject

@property (nonatomic,strong) NSString* itemId;
@property (nonatomic,strong) NSString* itemName;
@property (nonatomic,strong) NSString* itemDescription;
@property (nonatomic,strong) NSString* itemImage;
@property (nonatomic,strong) NSString* typeItemId;
@property (nonatomic,strong) NSString* itemBasicPrice;
@property (nonatomic,strong) NSArray* itemFeatureSectionIdArray;

+(DCKeyValueObjectMapping*) getParser;

@end
