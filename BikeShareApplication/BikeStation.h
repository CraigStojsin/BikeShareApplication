//
//  MapPoint.h
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface BikeStation : NSObject<MKAnnotation>

@property (nonatomic,readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *availableDocks;
@property (nonatomic,copy) NSString *totalDocks;
@property (nonatomic,copy) NSString *availableBikes;
@property (nonatomic,copy) NSNumber *lng;
@property (nonatomic,copy) NSNumber *lat;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
