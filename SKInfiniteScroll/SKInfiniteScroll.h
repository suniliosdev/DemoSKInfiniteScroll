
#import <UIKit/UIKit.h>

typedef enum {
    kScrollDirectionTop,
    kScrollDirectionBottom,
	kScrollDirectionLeft,
	kScrollDirectionRight
}ScrollDirection;

#define SKInfiniteScroll_scroll_speed  3

@interface SKInfiniteScroll : UIScrollView<UIScrollViewDelegate>{

}
@property(nonatomic,strong) NSArray *arrAllAnimatingImages;
@property(nonatomic,assign) CGSize sizeImageSize;
@property(assign) ScrollDirection animationDirection;
+(SKInfiniteScroll*)createAnimateScrollOfImages:(NSArray*)arrayOfImages ofScrollRect:(CGRect)rect ofImageSize:(CGSize)imageSize InView:(UIView*)aSuperView withDirection:(ScrollDirection)aDirection;
@end
