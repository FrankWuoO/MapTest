//
//  FWAnnotationView.m
//  MapTest
//
//  Created by Frank Wu on 2016/7/15.
//
//

#import "FWAnnotationView.h"
#import "FWAnnotation.h"

@implementation FWAnnotationView
@synthesize annotation = _annotation;

-(instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSLog(@"Create!");
    }
    
    return self;
}

-(void)setAnnotation:(id<MKAnnotation>)annotation{
    NSLog(@"Set annotation");
    FWAnnotation *kAnnotation = annotation;
    self.image = kAnnotation.image;
    _annotation = annotation;
}


@end
