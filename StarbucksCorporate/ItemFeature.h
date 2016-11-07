//
//  ItemFeature.h
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

@interface ItemFeature : NSObject

@property (nonatomic,strong) NSString* itemFeatureId;
@property (nonatomic,strong) NSString* itemFeatureName;
@property (nonatomic,strong) NSString* itemFeatureAdicionalPrice;
+(DCKeyValueObjectMapping*) getParser;
@end
