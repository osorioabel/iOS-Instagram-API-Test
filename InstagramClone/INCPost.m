//
//  INCPost.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCPost.h"

@implementation INCPost

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    // Store a value that needs to be determined locally upon initialization.
    //_retrievedAt = [NSDate date];

    return self;
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return dateFormatter;
}


#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"postId": @"id",
             @"user": @"user",
             @"type": @"type",
             @"caption": @"caption",
             @"images": @"images",
             @"likes": @"likes.data",
             @"likesCount": @"likes.count",
             @"link": @"link",
             @"createdAt": @"created_time",
             @"filter": @"filter",
             @"comments": @"comments.data",
             @"commentsCount": @"comments.count",
             @"location": @"location",
             @"tags": @"tags",
             @"attribution": @"attribution"
             };
}

+ (NSValueTransformer *)linkJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)likesJSONTransformer {
    
    return [MTLJSONAdapter arrayTransformerWithModelClass:INCUser.class];
}

+ (NSValueTransformer *)commentsJSONTransformer {
    
    return [MTLJSONAdapter arrayTransformerWithModelClass:INCComment.class];
}


-(NSString*)dateForPublish{
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:[self.createdAt doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"E dd MMM yyyy HH:mm";
    return  [dateFormatter stringFromDate:date2];
}



@end
