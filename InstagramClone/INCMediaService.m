//
//  INCMediaService.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCMediaService.h"

NSString *const popularMediaUrl = @"media/popular";

@implementation INCMediaService

+ (void)getPopularMediaWithCompletion:(void (^)(id response, NSError *error))completionBlock{
    
    __block NSMutableArray *popularMedia = nil;
    __block NSError *error = nil;
    NSString *url = [NSString stringWithFormat:@"%@",popularMediaUrl];
    NSDictionary *parameters = @{@"client_id" : @"05132c49e9f148ec9b8282af33f88ac7"};
    [[INCAPIClient sharedClient] GET:url parameters:parameters success:^(NSURLSessionDataTask * __unused task, id responseObject ) {
        popularMedia = [[NSMutableArray alloc] initWithCapacity:[responseObject count]];
        for (NSDictionary *JSONPostData in responseObject[@"data"]) {
            INCPost*post = [MTLJSONAdapter modelOfClass:[INCPost class] fromJSONDictionary:JSONPostData error:&error];
            if (error) {
                NSLog(@"%@",error);
            }else{
                if (post) [popularMedia addObject:post];
            }
        }
        completionBlock(popularMedia,nil);
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        completionBlock(popularMedia,nil);
    }];
    
    
}

@end
