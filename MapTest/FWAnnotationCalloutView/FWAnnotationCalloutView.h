//
//  FWAnnotationCalloutView.h
//  MapTest
//
//  Created by FireWolf on 2016/8/11.
//
//

#import <UIKit/UIKit.h>
@class FWAnnotationCalloutView;

@protocol CalloutViewDelegate <NSObject>
-(void)calloutView:(FWAnnotationCalloutView *)view didChangeAngle:(NSNumber *)angle;
@end

@interface FWAnnotationCalloutView : UIView
@property (weak,nonatomic)id <CalloutViewDelegate> delegate;

-(void)updateTitle:(NSString *)title angle:(NSNumber *)angle;
@end
