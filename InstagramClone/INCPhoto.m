//
//  INCPhoto.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/16/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCPhoto.h"

@implementation INCPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    // Store a value that needs to be determined locally upon initialization.
    //_retrievedAt = [NSDate date];

    return self;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"url": @"url",
             @"width": @"width",
             @"height": @"height",
             };
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
