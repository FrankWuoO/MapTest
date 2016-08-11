//
//  FWAnnotationCalloutView.m
//  MapTest
//
//  Created by FireWolf on 2016/8/11.
//
//

#import "FWAnnotationCalloutView.h"
@interface FWAnnotationCalloutView()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISlider *sliderControl;

@end

@implementation FWAnnotationCalloutView
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FWAnnotationCalloutView" owner:self options:nil];
        self = nib[0];
    }
    return self;
}
-(void)awakeFromNib{
    self.layer.cornerRadius = 4.0f;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 1.0;
}
//更新Callout View 資料
-(void)updateTitle:(NSString *)title angle:(NSNumber *)angle{
    _titleLabel.text = title;
    self.sliderControl.value = [angle floatValue]/2;
}
- (IBAction)didChangeSlider:(UISlider *)sender {
    float degree = sender.value*2;
    [self.delegate calloutView:self didChangeAngle:@(degree)];
}


@end
