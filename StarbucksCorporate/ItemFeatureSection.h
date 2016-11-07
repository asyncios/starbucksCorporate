//
//  ItemFeatureSection.h
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

@interface ItemFeatureSection : NSObject

@property (nonatomic,strong) NSString* itemFeatureSectionId;
@property (nonatomic,strong) NSString* itemFeatureSectionName;
@property (nonatomic,strong) NSString* itemFeatureSectionDefaultId;
@property (nonatomic,strong) NSArray* itemFeatureIdArray;
+(DCKeyValueObjectMapping*) getParser;

@end
