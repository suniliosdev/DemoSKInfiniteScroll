
#import "SKImageEffect3D.h"

@interface SKImageEffect3D ()

@end
@implementation SKImageEffect3D

-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

-(void)awakeFromNib{
    [self initialize];
}

-(void)initialize{
    CGRect rectImageContent = CGRectMake(0, -const_image_offset_Y, self.frame.size.width, self.frame.size.height + 2*const_image_offset_Y);
    _imgContentView=[[UIImageView alloc] initWithFrame:rectImageContent];
    [self addSubview:_imgContentView];
    self.clipsToBounds=YES;
    
//    [self addShadowTo:_imgContentView];
}

-(void)adjustImageOfRect:(CGRect)rect ofOffset:(CGPoint)offset{
    
    if (!self.window) {
        self.window=[UIApplication sharedApplication].keyWindow;
    }
    
    rect = CGRectOffset(rect, -offset.x, -offset.y);
    CGFloat offsetY = rect.origin.y + rect.size.height/2;
    CGFloat value = offsetY - self.window.frame.size.height/2;
    value=-value/30;
    CGRect frame = self.imgContentView.frame;
    self.imgContentView.frame=CGRectMake(frame.origin.x, value - const_image_offset_Y, frame.size.width, frame.size.height);
    
}


-(void)addShadowTo:(UIView*)aView{

    NSArray *shadowDirections = [NSArray arrayWithObjects:@"top", @"bottom", nil];
    UIColor *color = [UIColor colorWithRed:(0.0) green:(0.0) blue:(0.0) alpha:0.5];
    
    UIView *shadowView = [self createShadowViewWithRadius:33 Color:color Directions:shadowDirections];
    [self addSubview:shadowView];
}

- (UIView *) createShadowViewWithRadius:(float)radius Color:(UIColor *)color Directions:(NSArray *)directions
{
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    shadowView.backgroundColor = [UIColor clearColor];
    
    // Ignore duplicate direction
    NSMutableDictionary *directionDict = [[NSMutableDictionary alloc] init];
    for (NSString *direction in directions) [directionDict setObject:@"1" forKey:direction];
    
    for (NSString *direction in directionDict) {
        // Ignore invalid direction
            CAGradientLayer *shadow = [CAGradientLayer layer];
            
            if ([direction isEqualToString:@"top"]) {
                [shadow setStartPoint:CGPointMake(0.5, 0.0)];
                [shadow setEndPoint:CGPointMake(0.5, 1.0)];
                shadow.frame = CGRectMake(0, 0, self.bounds.size.width, radius);
            }
            else if ([direction isEqualToString:@"bottom"])
            {
                [shadow setStartPoint:CGPointMake(0.5, 1.0)];
                [shadow setEndPoint:CGPointMake(0.5, 0.0)];
                shadow.frame = CGRectMake(0, self.bounds.size.height - radius, self.bounds.size.width, radius);
            } else if ([direction isEqualToString:@"left"])
            {
                shadow.frame = CGRectMake(0, 0, radius, self.bounds.size.height);
                [shadow setStartPoint:CGPointMake(0.0, 0.5)];
                [shadow setEndPoint:CGPointMake(1.0, 0.5)];
            } else if ([direction isEqualToString:@"right"])
            {
                shadow.frame = CGRectMake(self.bounds.size.width - radius, 0, radius, self.bounds.size.height);
                [shadow setStartPoint:CGPointMake(1.0, 0.5)];
                [shadow setEndPoint:CGPointMake(0.0, 0.5)];
            }
            
            shadow.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
            [shadowView.layer insertSublayer:shadow atIndex:0];
    }
    
    return shadowView;
}



@end
