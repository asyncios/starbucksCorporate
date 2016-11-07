//
//  Item.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "Item.h"

@implementation Item

+(DCKeyValueObjectMapping*) getParser{
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    return [DCKeyValueObjectMapping mapperForClass: [Item class] andConfiguration:config];
}

@end
