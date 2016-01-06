//
//  INCPost.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "INCUser.h"
#import "INCCaption.h"
#include "INCLocation.h"
#import "INCImage.h"
#import "INCComment.h"

@interface INCPost : MTLModel<MTLJSONSerializing>


@property (nonatomic, copy, readonly) INCUser *user;
@property (nonatomic, copy, readonly) NSString *postId;
@property (nonatomic, copy, readonly) NSString *type;
@property (nonatomic, copy, readonly) INCCaption *caption;
@property (nonatomic, copy, readonly) INCImage *images;
@property (nonatomic, copy, readonly) NSArray *likes;
@property (nonatomic, copy, readonly) NSNumber *likesCount;
@property (nonatomic, copy, readonly) NSURL *link;
@property (nonatomic, copy, readonly) NSString *createdAt;
@property (nonatomic, copy, readonly) NSString *filter;
@property (nonatomic, copy, readonly) NSArray *comments;
@property (nonatomic, copy, readonly) NSNumber *commentsCount;
@property (nonatomic, copy, readonly) INCLocation *location;
@property (nonatomic, copy, readonly) NSArray *tags;
@property (nonatomic, copy, readonly) NSString *attribution;


-(NSString*)dateForPublish;

@end
