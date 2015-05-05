
 // Stations.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.


#import "StationManager.h"
#import "BikeStation.h"

@implementation StationManager

{
    NSDictionary *stations;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.http = [[HTTPCommunication alloc] init];
    }
    return self;
}



- (void)listOfStationsSucess:(void (^)(NSArray *listOfStation))sucess{

    //retrieve the jokes using http communication
    NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    
    [_http retrieveURL:url successBlock:^(NSData *response){
        NSError *error =  nil;
        
        //deserialize the informtion we get from the API
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        
        if(!error)
        {
            NSArray *stationList = data[@"stationBeanList"];
            NSMutableArray *resultList = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in stationList)
            {
                BikeStation *station = [[BikeStation alloc] initWithDictionary:dict];
                [resultList addObject:station];
            }
            if (sucess)
            {
                sucess(resultList);
            }
        }
    }];
   
    
}


@end
