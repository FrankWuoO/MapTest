//
//  ViewController.m
//  MapTest
//
//  Created by Frank wu on 2016/7/15.
//
//

#import "ViewController.h"


#import "FWAnnotation.h"
#import "FWAnnotationView.h"


#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property(nonatomic)MKMapView *appleMap;
@property(nonatomic)NSArray *annotationsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
    
    [self TESTData];//產生測試資料
    [_appleMap addAnnotations:_annotationsArray];//把資料輸入進地圖
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initLayout{
    _appleMap = [[MKMapView alloc]initWithFrame:self.view.frame];
    _appleMap.delegate = self;
    
    CLLocationCoordinate2D ground = CLLocationCoordinate2DMake(25.033474, 121.564588);
    MKMapCamera *myCamera = [MKMapCamera cameraLookingAtCenterCoordinate:ground fromDistance:1500 pitch:0 heading:0];
    _appleMap.camera = myCamera;
    [self.view addSubview:_appleMap];
}

-(void)TESTData{
    NSArray *titleArray = @[@"蛋糕",@"蝴蝶",@"小丑魚",@"小豬"];
    NSArray *imageArray = @[[UIImage imageNamed:@"Birthday"],
                            [UIImage imageNamed:@"Butterfly"],
                            [UIImage imageNamed:@"ClownFish"],
                            [UIImage imageNamed:@"Pig"]
                            ];
    
    CLLocationCoordinate2D coordinates[4];
    coordinates[0] = CLLocationCoordinate2DMake(25.033276, 121.562383);
    coordinates[1] = CLLocationCoordinate2DMake(25.032489, 121.564145);
    coordinates[2] = CLLocationCoordinate2DMake(25.033597, 121.566607);
    coordinates[3] = CLLocationCoordinate2DMake(25.033218, 121.565604);
    
    NSMutableArray *kArray = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        FWAnnotation *annotation = [[FWAnnotation alloc]initWithTitle:titleArray[i]
                                                           coordinate:coordinates[i]
                                                            thumbnail:imageArray[i]];
        [kArray addObject:annotation];
    }
    _annotationsArray = [kArray copy];
}

#pragma mark - Delegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    MKAnnotationView *annotationView = nil;
    if ([[annotation class]isSubclassOfClass:[MKUserLocation class]]||
        [[annotation class]isSubclassOfClass:[MKPointAnnotation class]]) {
        return nil;
    }
    if ([[annotation class]isSubclassOfClass:[FWAnnotation class]]) {
        annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"FWAnnotationView"];
        if (!annotationView) {
            annotationView = [[FWAnnotationView alloc]initWithAnnotation:annotation
                                                         reuseIdentifier:@"FWAnnotationView"];
        }
        else{
            annotationView.annotation = annotation;
        }
    }
    return annotationView;
}
@end
