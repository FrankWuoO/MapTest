//
//  FWAnnotationView.m
//  MapTest
//
//  Created by Frank Wu on 2016/7/15.
//
//

#import "FWAnnotationView.h"
#import "FWAnnotation.h"
#import "FWAnnotationCalloutView.h"

@interface FWAnnotationView()<CalloutViewDelegate>

@property (nonatomic)FWAnnotationCalloutView *calloutView;
@property (nonatomic)UIImageView *annotaionThumbnail;

@end

@implementation FWAnnotationView
@synthesize annotation = _annotation;

-(instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.opaque = NO;
        self.canShowCallout = NO;
        _annotaionThumbnail = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
        [self addSubview:_annotaionThumbnail];
        self.bounds = _annotaionThumbnail.bounds;
    }
    return self;
}
//更新Annotation
-(void)setAnnotation:(id<MKAnnotation>)annotation{
    FWAnnotation *kAnnotation = annotation;
    _annotation = annotation;
    
    _annotaionThumbnail.image = kAnnotation.image;
    _annotaionThumbnail.transform = CGAffineTransformMakeRotation(M_PI* [kAnnotation.angle floatValue]);
}
//判斷是否點擊到此Annotation View
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView != nil)
    {
        [self.superview bringSubviewToFront:self];
    }

    return hitView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect rect = self.bounds;
    BOOL isInside = CGRectContainsPoint(rect, point);
    if(!isInside)
    {
        for (UIView *view in self.subviews)
        {
            isInside = CGRectContainsPoint(view.frame, point);
            if(isInside){
                break;
            }
        }
    }
    return isInside;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:YES];
    
    // Annotation View 選取與未選取
    if (!selected) {
        //移除Callout view
        [_calloutView removeFromSuperview];
        _calloutView = nil;
    }
    else{
        //顯示Callout view
        FWAnnotation *kAnnotation = _annotation;

        _calloutView = [[FWAnnotationCalloutView alloc]init];
        CGFloat centerY = -self.calloutView.frame.size.height/2 - 8 ;
        _calloutView.center = CGPointMake(0, centerY);
        _calloutView.delegate = self;
        [self addSubview:self.calloutView];
        [self.superview bringSubviewToFront:self.calloutView];
        [_calloutView updateTitle:kAnnotation.title angle:kAnnotation.angle];
    }
}

#pragma mark - Delegate
-(void)calloutView:(FWAnnotationCalloutView *)view didChangeAngle:(NSNumber *)angle{
    _annotaionThumbnail.transform = CGAffineTransformMakeRotation(M_PI* [angle floatValue]);
    //更新Annotation資料
    FWAnnotation *kAnnotation = _annotation;
    kAnnotation.angle = angle;
    
}
@end
