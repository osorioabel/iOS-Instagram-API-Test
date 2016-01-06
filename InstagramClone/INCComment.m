//
//  INCComment.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCComment.h"

@implementation INCComment

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
             @"text": @"text",
             @"from": @"from",
             @"commentId": @"id",
             @"createdAt": @"created_time",
             };
}

-(NSString*)dateForComment{
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[self.createdAt doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"MMM dd yyyy HH:mm";
    return  [dateFormatter stringFromDate:date2];
}



@end
