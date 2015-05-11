//
//  MoreInfoVC.m
//  BikeShareApplication
//
//  Created by Craig Stojsin on 2015-05-05.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//
#import "StationManager.h"
#import "BikeStation.h"
#import "MoreInfoVC.h"
#import "UIColor+UIColor_Flat.h"
@interface MoreInfoVC ()
@property (nonatomic,strong) MoreInfoVC *moreInfoVC;
@property (nonatomic, strong) StationManager *stations;
@end

@implementation MoreInfoVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        
      
        self.navigationItem.title =@"More Info";
       
        
        self.view.backgroundColor = [UIColor emerald];
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.stations = [[StationManager alloc]init];
   
    
    
    [self.stations listOfStationsSucess:^(NSArray *listOfStation) {
        
        for (BikeStation *bikeStation in listOfStation)
        {
            
            
            [self.moreInfoVC addAnnotation:bikeStation];
        }
     
    
    }];
    
    self.titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(35, 70, 110, 23)];
    self.titleLabel.text = @"StationName";
    self.titleLabel.font =[UIFont fontWithName:@"TimesNewRoman" size:30];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
