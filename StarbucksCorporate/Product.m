//
//  Product.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "Product.h"

@implementation Product

+(DCKeyValueObjectMapping*) getParser{
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    return [DCKeyValueObjectMapping mapperForClass: [Product class] andConfiguration:config];
}
@end
