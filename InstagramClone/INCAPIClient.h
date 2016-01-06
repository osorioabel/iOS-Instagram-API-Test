//
//  INCAPIClient.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworkActivityIndicatorManager.h>
#import <AFHTTPSessionManager.h>

static NSString * const APIBaseURLString = @"https://api.instagram.com/v1/";

@interface INCAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
