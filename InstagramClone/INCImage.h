//
//  INCImage.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "INCPhoto.h"

@interface INCImage : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) INCPhoto *low;
@property (nonatomic, copy, readonly) INCPhoto *thumbnail;
@property (nonatomic, copy, readonly) INCPhoto *standardResolution;


@end
