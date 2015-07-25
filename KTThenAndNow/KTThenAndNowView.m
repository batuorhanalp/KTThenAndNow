//
//  KTThenAndNowView.m
//  KTThenAndNow
//
//  Created by Batu Orhanalp on 22/07/15.
//  Copyright (c) 2015 Batu Orhanalp. All rights reserved.
//

#import "KTThenAndNowView.h"
#import "KTDragButton.h"


@implementation KTThenAndNowView
{
    KTDragButton *dragButton;
    BOOL isVerticalDrag;
    CGFloat sizeLimitDrag;
}

- (instancetype)initWithFrame:(CGRect)frame
                   firstImage:(UIImage *)firstImage
                  secondImage:(UIImage *)secondImage
                   isVertical:(BOOL)isVertical
{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //Setting drag area for the selected frame;
        int dragLimit = frame.size.width;
        int staticLimit = frame.size.height;
        
        //Setting lineFrame and drag area for vertical
        if (isVertical) {
            dragLimit = frame.size.height;
            staticLimit = frame.size.width;
        }
        
        //Creating imageViews with given images
        NSArray *imagesArray = [[NSArray alloc] initWithObjects:firstImage, secondImage, nil];
        
        int j = 0;
        for (UIImage *image in imagesArray) {
            for (int i = 0; i < dragLimit; i++) {
                
                //Setting one line frame
                CGRect lineFrame = CGRectMake(i, 0, 1, image.size.height);
                if (isVertical) {
                    lineFrame = CGRectMake(0, i, image.size.width, 1);
                }
                
                UIImageView *lineView = [[UIImageView alloc] initWithFrame:lineFrame];
                
                if (j > 0) {
                    //Setting tag to find while dragging
                    lineView.tag = (i + 1) * 1000;
                    
                    //Setting alpha zero for the left side of upper image
                    if (i < (dragLimit / 2)) {
                        lineView.alpha = 0;
                    }
                }
                
                UIImage *croppedImage;
                if (isVertical) {
                    croppedImage = [self croppWithImage:image toRect:CGRectMake(0, i, image.size.width, 1)];
                } else {
                    croppedImage = [self croppWithImage:image toRect:CGRectMake(i, 0, 1, image.size.height)];
                }
                [lineView setImage:croppedImage];
                [lineView setClipsToBounds:YES];
                
                [self addSubview:lineView];
            }
            j++;
        }
        
        dragButton = [[KTDragButton alloc] initWithDragSize:dragLimit staticSize:staticLimit isVertical:isVertical];
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onDragButton:)];
        [dragButton addGestureRecognizer:panGestureRecognizer];
        
        [self setBackgroundColor:[UIColor blueColor]];
        [self addSubview:dragButton];
        
        //Assigning properties
        isVerticalDrag = isVertical;
        sizeLimitDrag = dragLimit;
        
        //[self hideAndShowImages];
        [self setClipsToBounds:YES];
    }
    
    return self;
}

- (void)onDragButton:(UIPanGestureRecognizer *)recognizer
{
    CGPoint touchPoint = [recognizer locationInView:self];
    //NSLog(@"Current position: %@", NSStringFromCGPoint(touchPoint));
    
    if (isVerticalDrag && touchPoint.y > -18 && touchPoint.y < sizeLimitDrag) {
        dragButton.center = CGPointMake(dragButton.center.x, touchPoint.y);
        [self hideAndShowImages];
    } else if (!isVerticalDrag && touchPoint.x > -18 && touchPoint.x < sizeLimitDrag){
        dragButton.center = CGPointMake(touchPoint.x, dragButton.center.y);
        [self hideAndShowImages];
    }
}

- (void)hideAndShowImages {
    
    for (int i = 1000; i <= sizeLimitDrag * 1000; i += 1000) {
        UIView *imageView = (UIView *)[self viewWithTag:i];
        
        if (isVerticalDrag) {
            if (i < dragButton.center.y * 1000) {
                imageView.alpha = 0.f;
            } else {
                imageView.alpha = 1.f;
            }
        } else {
            if (i < dragButton.center.x * 1000) {
                imageView.alpha = 0.f;
            } else {
                imageView.alpha = 1.f;
            }
        }
    }
}

- (UIImage *)croppWithImage:(UIImage *)image
                     toRect:(CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    
    return croppedImage;
}

@end
