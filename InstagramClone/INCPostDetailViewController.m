//
//  INCPostDetailViewController.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCPostDetailViewController.h"

@interface INCPostDetailViewController ()

@end

@implementation INCPostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title=@"Detail";
    [self drawView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Comments";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.comments.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    INCCommentsTableViewCell*cell = (INCCommentsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    cell.selectionStyle= UITableViewCellSelectionStyleNone;
    cell.comment = [self.comments objectAtIndex:indexPath.row];
    cell.index = indexPath.row;
    [cell configureCell];
    return cell;
}

#pragma mark - Configuration stuff

-(void)drawView{
    
    self.autorNameLabel.text= self.post.user.username;
    self.publishDateLabel.text= [self.post dateForPublish];
    if (self.post.tags.count>0) {
        self.tagLabel.text= [NSString stringWithFormat:@"%@",[self.post.tags objectAtIndex:0]];
    }else{
        self.tagLabel.text=@"";
    }
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:self.post.images.standardResolution.url
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                UIImage *newImage = [image resizedImageToFitInSize:self.postImageView.bounds.size scaleIfSmaller:NO];
                                self.postImageView.image = newImage;
                            }else{
                                self.postImageView.image=[UIImage imageNamed:@"default"];
                            }
                        }];
    if (self.post.location ==nil) {
        self.locationButton.enabled = NO;
    }
    
}

#pragma mark - Actions

- (IBAction)sharePressed:(UIBarButtonItem *)sender {
    
    NSString *textToShare = NSLocalizedString(@"Look at this awesome Photo", nil);
    NSURL *shotUrl = self.post.images.low.url;
    NSArray *objectsToShare = @[textToShare, shotUrl];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludedActivities = @[UIActivityTypeAirDrop,UIActivityTypePostToWeibo,
                                    UIActivityTypeMessage, UIActivityTypeMail,
                                    UIActivityTypePrint, UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll,
                                    UIActivityTypeAddToReadingList, UIActivityTypePostToFlickr,
                                    UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo];
    controller.excludedActivityTypes = excludedActivities;
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)locationPressed:(id)sender {
    [self performSegueWithIdentifier:@"location" sender:self];
}

- (IBAction)profilePhotoPressed:(UIButton*)sender {
    self.commentSelected = [self.comments objectAtIndex:sender.tag];
    [self performSegueWithIdentifier:@"userProfile" sender:self];
}
- (IBAction)postImagePressed:(UIButton*)sender {
    [self performSegueWithIdentifier:@"userProfile" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"location"]) {
        INCPostLocationViewController *destinationViewController = (INCPostLocationViewController*)segue.destinationViewController;
        destinationViewController.post = self.post;
        
    } else if([segue.identifier isEqualToString:@"userProfile"]){
        INCUserProfileViewController *destinationViewController = (INCUserProfileViewController*)segue.destinationViewController;
        if (self.commentSelected!=nil) {
            destinationViewController.comment = self.commentSelected;
        }else{
            destinationViewController.post=self.post;
        }
        
    }
}


@end
