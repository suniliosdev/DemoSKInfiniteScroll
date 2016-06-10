# DemoSKInfiniteScroll
SKInfiniteScroll is a helper class enable you to scroll infinitely using images with parallax effect.

![Demo Gif](https://dl.dropboxusercontent.com/u/92255522/Xtra/Infinite%20scroll/mov.gif)

- Support all the four direction
- You can manage speed 
- Infinite scroll without jurk
- In build parallax effect for image view

## Installation
Copy and drag the 'SKInfiniteScroll' folder to your project

## How to use
#### 1. Create an array of images 

```objc
NSMutableArray *array=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"], nil];
```
#### 2. Call this class method of SKAnimateScroll

```objc
createAnimateScrollOfImages:(NSArray*)arrayOfImages ofScrollRect:(CGRect)rect ofImageSize:(CGSize)imageSize InView:(UIView*)aSuperView withDirection:(ScrollDirection)aDirection
```

Parameters:

   - rect : frame of scroll view
   - imageSize : size of image view
   - aSuperView : view inside which scrollview should visible
   - aDirection : animation direction 

