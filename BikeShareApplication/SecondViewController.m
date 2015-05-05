//
//  SecondViewController.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-04.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//
#import "HTTPCommunication.h"
#import "SecondViewController.h"
#import "MapViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //set long and lat
    
    double lat = 43.641566;
    double lng = -79.387057;
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lng);
    
    /*
     A MKPlacemark object stores placemark data for a given latitude and longitude. Placemark data includes information such as the country, state, city, and street address associated with the specified coordinate. You can initialize a placemark using the initWithPlacemark: inherited method or the initWithCoordinate:addressDictionary: method specifying a coordinate and address dictionary.
     */
    
    MKPlacemark *placemark= [[MKPlacemark alloc]initWithCoordinate:coord
                                                 addressDictionary:nil];
    
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:placemark];
    
    [mapItem openInMapsWithLaunchOptions:nil];
    
    
    
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
