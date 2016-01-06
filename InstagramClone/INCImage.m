//
//  INCImage.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCImage.h"

@implementation INCImage

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
             @"low": @"low_resolution",
             @"thumbnail": @"thumbnail",
             @"standardResolution": @"standard_resolution",
             };
}



@end
