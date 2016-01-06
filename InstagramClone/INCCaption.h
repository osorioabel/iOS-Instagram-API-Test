//
//  INCCaption.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "INCUser.h"

@interface INCCaption : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *commentId;
@property (nonatomic, copy, readonly) INCUser *from;
@property (nonatomic, copy, readonly) NSString *createdAt;

@end
