//BikeShare Application would like to use your current location
//  ViewController.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-04.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _mapView =[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_mapView];
    
    self.mapView.delegate = self;
    
    self.locationManger = [[CLLocationManager alloc]init];
    self.locationManger.delegate = self;
    self.locationManger= [[CLLocationManager alloc]init];
    if (IS_OS_8_OR_LATER) {
        [self.locationManger requestAlwaysAuthorization];
        [self.locationManger requestAlwaysAuthorization];
    }
    [self.locationManger startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest =YES;

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
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
    if (!view) {
        view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annoView"];
    
    }
    return view;
}

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
