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
@property (nonatomic,copy) UIImage *image;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D )newCoordinate andImage:(UIImage *)image
;
@end
