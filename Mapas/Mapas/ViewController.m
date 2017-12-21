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
    
    
    self.latitude.text = @"";
    self.longitude.text = @"";
    self.endereco.text = @"";
    UILongPressGestureRecognizer *gesture  = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(inserirAnotacao:)];
    gesture.minimumPressDuration = 1;
    [self.mapa addGestureRecognizer:gesture];

}

- (void) inserirAnotacao:(UILongPressGestureRecognizer*)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        CGPoint pontoSelecionado = [gesture locationInView:self.mapa];
        CLLocationCoordinate2D coordenadas = [self.mapa convertPoint:pontoSelecionado toCoordinateFromView:self.mapa];
        
        MKPointAnnotation *anotacao = [MKPointAnnotation new];
        anotacao.coordinate = coordenadas;
        anotacao.title = @"Aula iOS Mapas";
        
        [self.mapa addAnnotation:anotacao];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    CLLocation *userLocation = locations.lastObject;
    
    self.velocidade.text = @"";
    if(userLocation.speed > 0) {
        self.velocidade.text = [NSNumber numberWithInt:userLocation.speed].stringValue;
    }
    
    [[CLGeocoder new] reverseGeocodeLocation:userLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *local = placemarks.firstObject;
        self.endereco.text = local.thoroughfare;
    }];
    
    self.latitude.text = [NSNumber numberWithDouble:userLocation.coordinate.latitude].stringValue;
    self.longitude.text = [NSNumber numberWithDouble:userLocation.coordinate.longitude].stringValue;
    
    [self.mapa setRegion:(MKCoordinateRegionMake(userLocation.coordinate, (MKCoordinateSpanMake(0.1, 0.1))))];
}

@end
