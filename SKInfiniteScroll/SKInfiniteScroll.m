
#import "SKInfiniteScroll.h"
#import "SKImageEffect3D.h"
@implementation SKInfiniteScroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(SKInfiniteScroll*)createAnimateScrollOfImages:(NSArray*)arrayOfImages ofScrollRect:(CGRect)rect ofImageSize:(CGSize)imageSize InView:(UIView*)aSuperView withDirection:(ScrollDirection)aDirection{
    SKInfiniteScroll *scroll =[[SKInfiniteScroll alloc] initWithFrame:rect];
    scroll.arrAllAnimatingImages= arrayOfImages;
    scroll.sizeImageSize=imageSize;
    scroll.delegate=scroll;
    scroll.animationDirection=aDirection;
    [aSuperView addSubview:scroll];
    scroll.backgroundColor=[UIColor whiteColor];
    [scroll initializeScrollViewFirstTime];
    return scroll;
}

-(void)initializeScrollViewFirstTime{

	if (self.animationDirection == kScrollDirectionTop || self.animationDirection == kScrollDirectionBottom) {
		
		//create images view and add to scrollviews
		CGFloat yPosi=0;
		for (int i=0; i<self.arrAllAnimatingImages.count; i++) {
			SKImageEffect3D *imgView=[[SKImageEffect3D alloc] initWithFrame:CGRectMake(0, yPosi, self.sizeImageSize.width, self.sizeImageSize.height)];
			imgView.imgContentView.image=[self.arrAllAnimatingImages objectAtIndex:i];
			[self addSubview:imgView];
			yPosi=yPosi+self.sizeImageSize.height;
		}
		self.contentSize=CGSizeMake(self.sizeImageSize.width, yPosi);
		
		//get visible images count
		int visibleImages = self.frame.size.height/self.sizeImageSize.height;
		if (fmod(self.frame.size.height, self.sizeImageSize.height)) {
			visibleImages++;
		}
		
		for (int i=0; i<visibleImages; i++) {
			SKImageEffect3D *imgView=[[SKImageEffect3D alloc] initWithFrame:CGRectMake(0, yPosi, self.sizeImageSize.width, self.sizeImageSize.height)];
			NSInteger indexOfImage = (i >= self.arrAllAnimatingImages.count)?fmod(i, self.arrAllAnimatingImages.count):i;
			imgView.imgContentView.image=[self.arrAllAnimatingImages objectAtIndex:indexOfImage];
			[self addSubview:imgView];
			yPosi=yPosi+self.sizeImageSize.height;
		}
		
		self.contentSize=CGSizeMake(self.sizeImageSize.width, yPosi);
		
	}else{
		
		//create images view and add to scrollviews
		CGFloat xPosi=0;
		for (int i=0; i<self.arrAllAnimatingImages.count; i++) {
			SKImageEffect3D *imgView=[[SKImageEffect3D alloc] initWithFrame:CGRectMake(xPosi,0, self.sizeImageSize.width, self.sizeImageSize.height)];
			imgView.imgContentView.image=[self.arrAllAnimatingImages objectAtIndex:i];
			[self addSubview:imgView];
			xPosi=xPosi+self.sizeImageSize.width;
		}
		self.contentSize=CGSizeMake(xPosi,self.sizeImageSize.height);

		//get visible images count
		int visibleImages = self.frame.size.width/self.sizeImageSize.width;
		if (fmod(self.frame.size.width, self.sizeImageSize.width)) {
			visibleImages++;
		}
		
		for (int i=0; i<visibleImages; i++) {
			SKImageEffect3D *imgView=[[SKImageEffect3D alloc] initWithFrame:CGRectMake(xPosi,0, self.sizeImageSize.width, self.sizeImageSize.height)];
			NSInteger indexOfImage = (i >= self.arrAllAnimatingImages.count)?fmod(i, self.arrAllAnimatingImages.count):i;
			imgView.imgContentView.image=[self.arrAllAnimatingImages objectAtIndex:indexOfImage];
			[self addSubview:imgView];
			xPosi=xPosi+self.sizeImageSize.width;
		}
		
		self.contentSize=CGSizeMake(xPosi,self.sizeImageSize.height);

		
	}

	
    CGFloat speedValue = SKInfiniteScroll_scroll_speed;
    
    CGFloat interval  = 1 / (speedValue*10);
    if (self.animationDirection == kScrollDirectionTop) {
        [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(animateAndScrollToTop) userInfo:nil repeats:YES];
    }else if(self.animationDirection == kScrollDirectionBottom){
        [self setContentOffset:CGPointMake(self.contentOffset.x, self.arrAllAnimatingImages.count*self.sizeImageSize.height)];
        [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(animateAndScrollToBottom) userInfo:nil repeats:YES];
    }else if(self.animationDirection == kScrollDirectionLeft){
        [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(animateAndScrollToLeft) userInfo:nil repeats:YES];
    }else if(self.animationDirection == kScrollDirectionRight){
        [self setContentOffset:CGPointMake(self.arrAllAnimatingImages.count*self.sizeImageSize.height,self.contentOffset.y )];
        [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(animateAndScrollToRight) userInfo:nil repeats:YES];
    }
    
    
}

-(void)animateAndScrollToTop{
    NSInteger speedValue = SKInfiniteScroll_scroll_speed;
    CGPoint newPoint=CGPointMake(self.contentOffset.x, self.contentOffset.y+speedValue);
    [self setContentOffset:newPoint animated:NO];
}
-(void)animateAndScrollToBottom{
    NSInteger speedValue = SKInfiniteScroll_scroll_speed;
    CGPoint newPoint=CGPointMake(self.contentOffset.x, self.contentOffset.y-speedValue);
    [self setContentOffset:newPoint animated:NO];
}
-(void)animateAndScrollToLeft{
    NSInteger speedValue = SKInfiniteScroll_scroll_speed;
    CGPoint newPoint=CGPointMake(self.contentOffset.x+speedValue, self.contentOffset.y);
    [self setContentOffset:newPoint animated:NO];
}
-(void)animateAndScrollToRight{
    NSInteger speedValue = SKInfiniteScroll_scroll_speed;
    CGPoint newPoint=CGPointMake(self.contentOffset.x-speedValue, self.contentOffset.y);
    [self setContentOffset:newPoint animated:NO];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    UIWindow *window;
    if (!window) {
        window=[UIApplication sharedApplication].keyWindow;
    }
    
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[SKImageEffect3D class]]) {
            SKImageEffect3D *contentView = (SKImageEffect3D*)obj;
            [contentView adjustImageOfRect:contentView.frame ofOffset:self.contentOffset];
        }
    }];
    

    if (self.animationDirection == kScrollDirectionTop) {
        if (scrollView.contentOffset.y >= self.arrAllAnimatingImages.count*self.sizeImageSize.height) {
            
            [self setContentOffset:CGPointZero];
        }
    }else if (self.animationDirection == kScrollDirectionBottom){
        if (scrollView.contentOffset.y <= 0) {
            [self setContentOffset:CGPointMake(self.contentOffset.x, self.arrAllAnimatingImages.count*self.sizeImageSize.height)];
        }
    }else if (self.animationDirection == kScrollDirectionLeft){
        if (scrollView.contentOffset.x >= self.arrAllAnimatingImages.count*self.sizeImageSize.width) {
            
            [self setContentOffset:CGPointZero];
        }
    }else if (self.animationDirection == kScrollDirectionRight){
        if (scrollView.contentOffset.x <= 0) {
            [self setContentOffset:CGPointMake(self.arrAllAnimatingImages.count*self.sizeImageSize.width, self.contentOffset.y)];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
