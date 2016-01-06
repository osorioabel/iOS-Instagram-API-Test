//
//  INCPhotoCollectionViewCell.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INCPost.h"

@interface INCPhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mediaImage;
@property (weak, nonatomic) IBOutlet UILabel *mediaTitle;
@property (strong,nonatomic) INCPost *post;

-(void)configureCell;

@end
