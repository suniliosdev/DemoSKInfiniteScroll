//
//  ViewController.m
//  DemoSKInfiniteScroll
//
//  Created by Sunil on 6/10/16.
//  Copyright © 2016 Spaceo. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSMutableArray *array=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"demo_1.jpg"],[UIImage imageNamed:@"demo_2.jpg"],[UIImage imageNamed:@"demo_3.jpg"], nil];
    
    
    CGFloat widthImage=self.view.frame.size.width/2;
    
    CGRect rectScroll1= CGRectMake(0, 0, widthImage, self.view.frame.size.height);
    CGSize sizeImage1 = CGSizeMake(widthImage,  widthImage);
    [SKInfiniteScroll createAnimateScrollOfImages:array ofScrollRect:rectScroll1 ofImageSize:sizeImage1 InView:self.view withDirection:kScrollDirectionTop];
    
    CGRect rectScroll2= CGRectMake(widthImage, 0, widthImage, self.view.frame.size.height);
    CGSize sizeImage2 = CGSizeMake(widthImage,  widthImage);
    [SKInfiniteScroll createAnimateScrollOfImages:array ofScrollRect:rectScroll2 ofImageSize:sizeImage2 InView:self.view withDirection:kScrollDirectionBottom];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
