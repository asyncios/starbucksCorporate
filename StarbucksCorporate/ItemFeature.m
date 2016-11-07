//
//  ItemFeature.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemFeature.h"

@implementation ItemFeature

+(DCKeyValueObjectMapping*) getParser{
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    return [DCKeyValueObjectMapping mapperForClass: [ItemFeature class] andConfiguration:config];
}

@end
