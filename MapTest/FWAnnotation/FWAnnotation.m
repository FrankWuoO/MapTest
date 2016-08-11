//
//  FWAnnotation.m
//  MapTest
//
//  Created by Frank Wu on 2016/7/15.
//
//

#import "FWAnnotation.h"

@implementation FWAnnotation
- (instancetype)initWithTitle:(NSString *)title
                   coordinate:(CLLocationCoordinate2D)newCoordinate
                    thumbnail:(UIImage *)image
{
    self = [super init];
    if (self) {
        _title = title;
        _coordinate = newCoordinate;
        _image = image;
        _angle = @(0.0);
    }
    return self;
}
@end
