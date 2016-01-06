//
//  INCUser.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/16/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface INCUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSURL *profilePhoto;
@property (nonatomic, copy, readonly) NSString *fullName;
@property (nonatomic, copy, readonly) NSString *userId;
@property (nonatomic,strong) NSURL *profileUrl;

@end
