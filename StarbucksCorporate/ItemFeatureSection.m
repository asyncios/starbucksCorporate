//
//  ItemFeatureSection.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemFeatureSection.h"

@implementation ItemFeatureSection

+(DCKeyValueObjectMapping*) getParser{
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    return [DCKeyValueObjectMapping mapperForClass: [ItemFeatureSection class] andConfiguration:config];
}

@end
