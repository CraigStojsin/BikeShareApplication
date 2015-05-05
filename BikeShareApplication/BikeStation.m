//
//  MapPoint.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

#import "BikeStation.h"

@implementation BikeStation

//-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subTitle:(NSString *)st
//{
//    
//}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.title = dict[@"stationName"];
        self.title = dict[@"availableDocks"];
        self.title = dict[@"totalDocks"];
        self.title = dict[@"availableBikes"];
        NSNumber *lng =dict[@"longitude"];
        [lng doubleValue];
        NSNumber *lat = dict[@"latitude"];
        [lat doubleValue];
    }
    return self;
}
@end
