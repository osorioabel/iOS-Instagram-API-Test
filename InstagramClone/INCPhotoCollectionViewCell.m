//
//  INCPhotoCollectionViewCell.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCPhotoCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>
#import "INCPost.h"

@implementation INCPhotoCollectionViewCell

-(void)configureCell{

    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:self.post.images.thumbnail.url
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                UIImage *newImage = [image resizedImageToFitInSize:self.mediaImage.bounds.size scaleIfSmaller:NO];
                                self.mediaImage.image = newImage;
                            }else{
                                self.mediaImage.image=[UIImage imageNamed:@"default"];
                            }
                        }];
    self.mediaTitle.text = self.post.caption.text;
}

@end
