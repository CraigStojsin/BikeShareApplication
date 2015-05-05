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
@interface StationManager : NSObject

@property (nonatomic, strong) HTTPCommunication *http;

- (void)listOfStationsSucess:(void (^)(NSArray *listOfStation))sucess;

@end
