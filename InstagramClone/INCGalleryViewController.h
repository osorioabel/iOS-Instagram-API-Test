//
//  INCGalleryViewController.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INCMediaService.h"
#import "INCUtils.h"
#import "INCPhotoCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>
#import "INCPostDetailViewController.h"
#import <MRProgress/MRProgress.h>

@interface INCGalleryViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) NSArray *media;
@property (strong,nonatomic) INCPost *mediaSelected;
@property (strong,nonatomic) NSIndexPath *actualIndex;
@property (weak, nonatomic) IBOutlet UIImageView *postPreviewImage;

@end
