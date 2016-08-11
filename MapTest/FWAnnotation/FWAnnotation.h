//
//  FWAnnotation.h
//  MapTest
//
//  Created by Frank Wu on 2016/7/15.
//
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface FWAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readwrite)CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) UIImage *image;
@property (nonatomic)NSNumber *angle;


- (instancetype)initWithTitle:(NSString *)title
                   coordinate:(CLLocationCoordinate2D )newCoordinate
                     thumbnail:(UIImage *)image;
@end
