//
//  ViewController.m
//  Mapas
//
//  Created by Cast Group on 19/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import "MapaViewController.h"
#import <MapKit/MapKit.h>
#import "Viagem+CoreDataClass.h"
#import "AppDelegate.h"

@interface MapaViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@property(strong, nonatomic) CLLocationManager *locationManager;

@property (nonatomic, strong, readonly) NSManagedObjectContext *gerenciadorObjetos;

@end

@implementation MapaViewController

@synthesize gerenciadorObjetos = _gerenciadorObjetos;

- (NSManagedObjectContext*) gerenciadorObjetos{
    
    if (!_gerenciadorObjetos) {
        AppDelegate *delegate =  (AppDelegate*)[UIApplication sharedApplication].delegate;
        _gerenciadorObjetos =  delegate.persistentContainer.viewContext;
    }
    return _gerenciadorObjetos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view, typically from a nib.
    
    if(self.viagemApresentacao) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:self.viagemApresentacao.latitude longitude:self.viagemApresentacao.longitude];
        
        MKPointAnnotation *anotacao = [MKPointAnnotation new];
        
        anotacao.coordinate = location.coordinate;
        
        anotacao.title = self.viagemApresentacao.descricao;
        
        [self.mapa addAnnotation: anotacao];
    }
    else {
        UILongPressGestureRecognizer *gesture  = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(inserirAnotacao:)];
        gesture.minimumPressDuration = 1;
        [self.mapa addGestureRecognizer:gesture];
    }
    
    
}

- (void) inserirAnotacao:(UILongPressGestureRecognizer*)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        CGPoint pontoSelecionado = [gesture locationInView:self.mapa];
        CLLocationCoordinate2D coordenadas = [self.mapa convertPoint:pontoSelecionado toCoordinateFromView:self.mapa];
        
        MKPointAnnotation *anotacao = [MKPointAnnotation new];
        
        anotacao.coordinate = coordenadas;
        
        CLLocation *location = [[CLLocation alloc] initWithLatitude:coordenadas.latitude longitude:coordenadas.longitude];
        
        [[CLGeocoder new] reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            CLPlacemark *place =  placemarks.firstObject;
            
            UIAlertController *confirmaViagem = [UIAlertController alertControllerWithTitle:@"Nova Viagem" message:@"Confirma inclusão de nova viagem?" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *acaoNao = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [self.mapa removeAnnotations:self.mapa.annotations];
            }];
            
            UIAlertAction *acaoSim = [UIAlertAction actionWithTitle:@"Sim" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self adicionaViagem:place comCoordenadas:coordenadas comError:error];
                [self.mapa addAnnotation:anotacao];
                UIAlertController *mensagemSucesso = [UIAlertController alertControllerWithTitle:@"Sucesso" message:@"Viagem inserida com sucesso!" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *acaoConcluir = [UIAlertAction actionWithTitle:@"Concluir" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                
                [mensagemSucesso addAction:acaoConcluir];
                
                [self presentViewController:mensagemSucesso animated:YES completion:nil];
            }];
            
            [confirmaViagem addAction:acaoNao];
            [confirmaViagem addAction:acaoSim];
            
            [self presentViewController:confirmaViagem animated:YES completion:nil];

        }];
        
        
    }
    
    
    
}

-(void) adicionaViagem: (CLPlacemark*) place comCoordenadas:(CLLocationCoordinate2D) coordenadas comError:(NSError*) error {
    
    NSMutableArray* valores = [@[] mutableCopy];
    
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.thoroughfare]];
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.subThoroughfare]];
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.locality]];
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.subLocality]];
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.postalCode]];
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.administrativeArea]];
    [self adicionaNoArray:valores aString:[self retornaStringOuNulo:place.subAdministrativeArea]];
    
    NSString *descricao = [valores componentsJoinedByString:@" - "];
    
    Viagem *novaTarefa = [NSEntityDescription insertNewObjectForEntityForName:@"Viagem" inManagedObjectContext:self.gerenciadorObjetos];
    [novaTarefa setDescricao:descricao];
    novaTarefa.latitude = coordenadas.latitude;
    novaTarefa.longitude = coordenadas.longitude;
    
    [self.gerenciadorObjetos save:&error];
    
}

- (NSString*) retornaStringOuNulo:(NSString*) string {
    if(string) {
        return string;
    }
    return nil;
}

- (void) adicionaNoArray:(NSMutableArray*) array aString:(NSString*) string {
    if(string) {
        [array addObject:string];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    
//    CLLocation *userLocation = locations.lastObject;
//    
//    self.velocidade.text = @"";
//    if(userLocation.speed > 0) {
//        self.velocidade.text = [NSNumber numberWithInt:userLocation.speed].stringValue;
//    }
//    
//    [[CLGeocoder new] reverseGeocodeLocation:userLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        CLPlacemark *local = placemarks.firstObject;
//        self.endereco.text = local.thoroughfare;
//    }];
//    
//    self.latitude.text = [NSNumber numberWithDouble:userLocation.coordinate.latitude].stringValue;
//    self.longitude.text = [NSNumber numberWithDouble:userLocation.coordinate.longitude].stringValue;
//    
//    [self.mapa setRegion:(MKCoordinateRegionMake(userLocation.coordinate, (MKCoordinateSpanMake(0.1, 0.1))))];
//}

@end
