//
//  MapPoint.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

#import "BikeStation.h"

@implementation BikeStation


- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.title = dict[@"stationName"];
        self.availableDocks = dict[@"availableDocks"];
        self.totalDocks = dict[@"totalDocks"];
        self.availableBikes = dict[@"availableBikes"];
        self.lng =dict[@"longitude"];
        self.lat = dict[@"latitude"];
        
        self.coordinate = CLLocationCoordinate2DMake([_lat doubleValue], [_lng doubleValue]);
    }
    return self;
}
@end
