//
//  TypeItem.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "TypeItem.h"

@implementation TypeItem

+(DCKeyValueObjectMapping*) getParser{
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    return [DCKeyValueObjectMapping mapperForClass: [TypeItem class] andConfiguration:config];
}

@end
