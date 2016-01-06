//
//  INCPostDetailViewController.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INCMediaService.h"
#import "INCUtils.h"
#import "INCComment.h"
#import "INCPhotoCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIImage-Resize/UIImage+Resize.h>
#import "INCCommentsTableViewCell.h"
#import "INCUserProfileViewController.h"
#import "INCPostLocationViewController.h"

@interface INCPostDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (strong,nonatomic) INCPost *post;

@property (strong,nonatomic) INCComment *commentSelected;
@property (strong,nonatomic) NSArray *comments;
@property (weak, nonatomic) IBOutlet UILabel *publishDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *autorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;


@end
