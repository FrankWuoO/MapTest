//
//  FWAnnotation.m
//  MapTest
//
//  Created by Frank Wu on 2016/7/15.
//
//

#import "FWAnnotation.h"

@implementation FWAnnotation
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D )newCoordinate andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _coordinate = newCoordinate;
        _image = image;
    }
    return self;
}
@end
