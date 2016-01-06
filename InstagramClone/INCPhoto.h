//
//  INCPhoto.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/16/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface INCPhoto : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *width;
@property (nonatomic, copy, readonly) NSURL *url;
@property (nonatomic, copy, readonly) NSNumber *height;

@end
