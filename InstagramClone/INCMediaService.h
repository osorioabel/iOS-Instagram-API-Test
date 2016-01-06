//
//  INCMediaService.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "INCPost.h"
#import "INCAPIClient.h"
#import <Mantle/Mantle.h>



@interface INCMediaService : NSObject

+ (void)getPopularMediaWithCompletion:(void (^)(id response, NSError *error))completionBlock;

@end
