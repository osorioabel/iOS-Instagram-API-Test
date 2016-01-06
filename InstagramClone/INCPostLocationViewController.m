//
//  INCPostLocationViewController.m
//  InstagramClone
//
//  Created by Abel Osorio on 11/17/15.
//  Copyright © 2015 Abel Osorio. All rights reserved.
//

#import "INCPostLocationViewController.h"

@interface INCPostLocationViewController ()

@end

#define METERS_PER_MILE 1609.344

@implementation INCPostLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
    [self setView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setView{
    
    self.title = @"Location";
    self.locationNameLabel.text = self.post.location.name;
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = [self.post.location.latitude doubleValue];
    zoomLocation.longitude= [self.post.location.longitude doubleValue];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = zoomLocation;
    point.title = self.post.user.username;
    point.subtitle =self.post.location.name;
    [self.mapView addAnnotation:point];
    [self.mapView setRegion:[self.mapView regionThatFits:viewRegion] animated:YES];
    
}



@end
