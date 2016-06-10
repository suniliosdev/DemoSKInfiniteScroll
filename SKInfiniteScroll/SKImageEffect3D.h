
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define const_image_offset_Y  25

@interface SKImageEffect3D : UIView
@property(nonatomic,strong) UIImageView *imgContentView;
@property(assign) CGPoint centerPoint;
@property(strong) UIWindow *window;

-(void)adjustImageOfRect:(CGRect)rect ofOffset:(CGPoint)offset;
@end
