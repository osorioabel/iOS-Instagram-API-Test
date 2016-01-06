//
//  INCUser.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/16/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCUser.h"

@implementation INCUser

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    // Store a value that needs to be determined locally upon initialization.
    //_retrievedAt = [NSDate date];
    
    self.profileUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.instagram.com/%@",self.username]];

    return self;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"fullName": @"full_name",
             @"userId": @"id",
             @"username": @"username",
             @"profilePhoto": @"profile_picture",
    };
}

+ (NSValueTransformer *)profilePhotoJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}


@end
