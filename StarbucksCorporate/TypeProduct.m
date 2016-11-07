//
//  TypeProduct.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "TypeProduct.h"

@implementation TypeProduct

+(DCKeyValueObjectMapping*) getParser{
    
    DCParserConfiguration *config = [DCParserConfiguration configuration];
    
    //To parse array of genres
    DCArrayMapping* productMapper = [DCArrayMapping mapperForClassElements:[Product class]
                                                              forAttribute:@"productArray"
                                                                   onClass:[TypeProduct class]];
    [config addArrayMapper:productMapper];
    return [DCKeyValueObjectMapping mapperForClass: [TypeProduct class] andConfiguration:config];
}

@end
