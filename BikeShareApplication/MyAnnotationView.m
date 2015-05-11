//
//  MyAnnotationView.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-06.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

#import "MyAnnotationView.h"
#import "MoreInfoVC.h"
@implementation MyAnnotationView


- (id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self){
        
        UIImage *altPin = [UIImage imageNamed:@"altPin"] ;
    self.image = altPin;
   self.canShowCallout =YES;

        
        
        self.leftCalloutAccessoryView = [[UIImageView alloc]
                                           initWithImage:
                                           [UIImage imageNamed:@"altPin"]];
    
        self.rightCalloutAccessoryView =[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    

    
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
