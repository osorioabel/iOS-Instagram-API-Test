//
//  INCUserProfileViewController.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INCPost.h"
#import "INCComment.h"
#import <MRProgress/MRProgress.h>

@interface INCUserProfileViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *profileWebView;
@property (strong,nonatomic) INCComment *comment;
@property (strong,nonatomic) INCPost *post;
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;


@end
