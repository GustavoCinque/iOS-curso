//
//  ViewController.m
//  Mapas
//
//  Created by Cast Group on 19/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@property(strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    CLLocation *userLocation = locations.lastObject;
    
    if(userLocation.speed > 0) {
        NSLog(@"Velocidade %f \n", userLocation.speed);
    }
    
    [[CLGeocoder new] reverseGeocodeLocation:userLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *local = placemarks.firstObject;
        
        
        NSLog(@"thoroughtfare: %@ \n", local.thoroughfare);
        NSLog(@"subthoroughtfare: %@ \n", local.subThoroughfare);
        NSLog(@"locality: %@ \n", local.locality);
        NSLog(@"sublocality: %@ \n", local.subLocality);
        NSLog(@"postalCode: %@ \n", local.postalCode);
        NSLog(@"country: %@ \n", local.country);
        NSLog(@"administrativeArea: %@ \n", local.administrativeArea);
        NSLog(@"subAdministrativeArea: %@ \n", local.subAdministrativeArea);
    }];
    
    [self.mapa setRegion:(MKCoordinateRegionMake(userLocation.coordinate, (MKCoordinateSpanMake(0.1, 0.1))))];
}

@end
