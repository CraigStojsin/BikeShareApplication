//
//  Stations.h
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//
#import "HTTPCommunication.h"
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Stations : NSObject <MKAnnotation>
@property (nonatomic, strong) HTTPCommunication *http;
@property (nonatomic, strong) NSNumber *responseID;



-(void)retrieveUrl;

@end
