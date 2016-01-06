//
//  INCCommentsTableViewCell.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCCommentsTableViewCell.h"

@implementation INCCommentsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCell{

    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:self.comment.from.profilePhoto
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                UIImage *newImage = [image resizedImageToFitInSize:self.userImageView.bounds.size scaleIfSmaller:NO];
                                self.userImageView.image = newImage;
                            }else{
                                self.userImageView.image=[UIImage imageNamed:@"default"];
                            }
                            self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2;
                            self.userImageView.clipsToBounds = YES;
                            self.userImageView.layer.borderWidth = 0.1;
                            self.userImageView.layer.borderColor = [UIColor whiteColor].CGColor;
                        }];

    self.commentTextLabel.text= self.comment.text;
    self.commentDateTextLabel.text = [self.comment dateForComment];
    self.usernameTextLabel.text= self.comment.from.username;
    self.imageProfileButton.tag=self.index;
}

@end
