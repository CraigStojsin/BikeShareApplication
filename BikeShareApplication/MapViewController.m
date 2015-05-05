//BikeShare Application would like to use your current location
//  ViewController.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-04.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//
#import "BikeStation.h"
#import "StationManager.h"
#import "HTTPCommunication.h"
#import "MapViewController.h"
#import "SecondViewController.h"
@interface MapViewController ()

@property (nonatomic, strong) StationManager *stations;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.stations = [[StationManager alloc]init];
    
    _mapView =[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_mapView];
    
    self.mapView.delegate = self;
    
    self.locationManger = [[CLLocationManager alloc]init];
    self.locationManger.delegate = self;
    if (IS_OS_8_OR_LATER) {
        [self.locationManger requestAlwaysAuthorization];
    }
    [self.locationManger startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.showsPointsOfInterest =YES;
    
    
//    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
//    [self.view addSubview:tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.stations listOfStationsSucess:^(NSArray *listOfStation) {
//        self.mapView addAnnotation:
    }];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
    if (!view) {
        view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annoView"];
        view.image = [UIImage imageNamed:@"altPin.png"];
    }
    return view;
    
}
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views

{

    MKAnnotationView *annotationView = [views objectAtIndex:0];
    
    id<MKAnnotation> mp = [annotationView annotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate] ,250,250);
    
    
    [mv setRegion:region animated:YES];
    
}

    


//}
//-(void)passDataForward
//{
//    SecondViewController *secondViewController = [[SecondViewController alloc]init];
//    secondViewController.data = self.label.text; //set the exposed property
//    [self.navigationController pushViewController:secondViewController animated:YES];
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
