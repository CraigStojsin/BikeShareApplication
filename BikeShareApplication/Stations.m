//
//  Stations.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

#import "Stations.h"

@implementation Stations


@synthesize coordinate;

-(void)retrieveUrl{

_http = [[HTTPCommunication alloc]init];

//retrieve the jokes using http communication
NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];

[_http retrieveURL:url successBlock:^(NSData *response){
    
    NSError *error =  nil;
    //deserialize the informtion we get from the API
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
    
    NSLog(@"%@",response);
    NSLog(@"%@",data);
    
    if(!error){
        NSDictionary *value = data[@"value"];
        if (value && value[@"value"])
        {
            _responseID = value[@"id"];
            
        }
        return ;
    }
    

}];
}




@end
