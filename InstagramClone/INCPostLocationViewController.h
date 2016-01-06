//
//  INCPostLocationViewController.h
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "INCPost.h"

@interface INCPostLocationViewController : UIViewController<MKMapViewDelegate>

@property(strong,nonatomic) INCPost *post;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@end
