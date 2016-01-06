//
//  INCUserProfileViewController.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCUserProfileViewController.h"

@interface INCUserProfileViewController ()

@end

@implementation INCUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.title = @"Profile";
    NSURLRequest* request;
    if (self.post !=nil) {
        request= [NSURLRequest requestWithURL:self.post.user.profileUrl];
    } else {
        request = [NSURLRequest requestWithURL:self.comment.from.profileUrl];
    }

    self.profileWebView.delegate = self;
    [self.profileWebView loadRequest:request];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.profileWebView stopLoading];
    [self.profileWebView removeFromSuperview];
    self.profileWebView=nil;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}
@end
