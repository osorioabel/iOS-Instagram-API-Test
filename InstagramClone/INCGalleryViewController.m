//
//  INCGalleryViewController.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCGalleryViewController.h"


@interface INCGalleryViewController ()

@end

@implementation INCGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpInterface];
    [self getPopularMedia];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.title=@"Photos";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Media Bussiness Logic

-(void)setUpInterface{
    
    [self.postPreviewImage setUserInteractionEnabled:YES];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.postPreviewImage addGestureRecognizer:swipeLeft];
    [self.postPreviewImage addGestureRecognizer:swipeRight];
    
}


-(void)getPopularMedia{
    [MRProgressOverlayView showOverlayAddedTo:self.view title:@"Loading" mode:MRProgressOverlayViewModeIndeterminateSmallDefault animated:YES];
    [INCMediaService getPopularMediaWithCompletion:^(id popularMedia, NSError *error){
       
        if (!error) {
            self.media = popularMedia;
            [self.collectionView reloadData];
            [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
            self.mediaSelected=[self.media objectAtIndex:0];
            self.actualIndex =[NSIndexPath indexPathForRow:0 inSection:0];
            [self refreshImageViewWithImageAtIndexPath:self.actualIndex];
        }else{
            [INCUtils showAlertMessageWithTitle:NSLocalizedString(@"ErrorRetrievingProductsTitle", nil) andMessage:NSLocalizedString(@"ErrorRetrievingProductsMessage", nil)];
        }
    }];
}

-(void)refreshImageViewWithImageAtIndexPath:(NSIndexPath*)indexPath{
    
    self.actualIndex = indexPath;
    self.mediaSelected = [self.media objectAtIndex:indexPath.row];
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:self.mediaSelected.images.standardResolution.url
                          options:0
                         progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                         }
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (image) {
                                UIImage *newImage = [image resizedImageToFitInSize:self.postPreviewImage.bounds.size scaleIfSmaller:NO];
                                self.postPreviewImage.image = newImage;
                            }else{
                                self.postPreviewImage.image=[UIImage imageNamed:@"default"];
                            }
                        }];
    
}

#pragma mark - Actions

- (IBAction)refreshPressed:(UIBarButtonItem *)sender {
    [self getPopularMedia];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (self.actualIndex.row !=self.media.count-1){
            self.actualIndex =[NSIndexPath indexPathForRow:self.actualIndex.row+1 inSection:0];
            [self refreshImageViewWithImageAtIndexPath:[NSIndexPath indexPathForRow:self.actualIndex.row inSection:0]];
        }else{
            self.actualIndex =[NSIndexPath indexPathForRow:0 inSection:0];
            [self refreshImageViewWithImageAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        }
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        if (self.actualIndex.row!=0) {
            self.actualIndex =[NSIndexPath indexPathForRow:self.actualIndex.row-1 inSection:0];
            [self refreshImageViewWithImageAtIndexPath:[NSIndexPath indexPathForRow:self.actualIndex.row inSection:0]];
        }else{
            self.actualIndex =[NSIndexPath indexPathForRow:self.media.count-1 inSection:0];
            [self refreshImageViewWithImageAtIndexPath:[NSIndexPath indexPathForRow:self.actualIndex.row inSection:0]];
        }
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(1,0, 1, 0); // top, left, bottom, right
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat size = floor((CGRectGetWidth(self.collectionView.bounds)-1) / 4);
    return CGSizeMake(size, size);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.media.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    INCPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mediaCell" forIndexPath:indexPath];
    cell.post= [self.media objectAtIndex:indexPath.row];
    [cell configureCell];
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.mediaSelected=[self.media objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"detail" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detail"]) {
        INCPostDetailViewController *destinationViewController = (INCPostDetailViewController*)segue.destinationViewController;
        destinationViewController.post = self.mediaSelected;
        destinationViewController.comments = self.mediaSelected.comments;
    }
}


@end
