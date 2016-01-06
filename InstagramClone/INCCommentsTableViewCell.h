//
//  INCCommentsTableViewCell.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INCComment.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>

@interface INCCommentsTableViewCell : UITableViewCell

@property (strong,nonatomic) INCComment *comment;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *commentTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentDateTextLabel;

@property (weak, nonatomic) IBOutlet UIButton *imageProfileButton;
@property (assign,nonatomic) NSInteger index;

-(void)configureCell;
@end
