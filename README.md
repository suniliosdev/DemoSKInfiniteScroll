# DemoSKInfiniteScroll

Do you know how to create an [infinite scroll while developing your iOS application](https://www.spaceotechnologies.com/create-infinite-scroll-ios-application/)?

No? Don’t worry then. 

I’ve a solution for you. I’ve programmed infinite scroll in one of our live projects at Space-O Technologies, trusted [iPhone App Development company](http://www.spaceotechnologies.com/iphone-app-development/) in India. I thought, it might be helpful to you as well, so I’ve uploaded the whole source code here. Feel free to download it. 

And if you’ve any questions regarding it, ask it in the comment section of the blog. I’ll get back to you as soon as possible. Enjoy! 


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

