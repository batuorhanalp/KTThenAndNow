//
//  KTDragButton.m
//  KTThenAndNow
//
//  Created by Batu Orhanalp on 25/07/15.
//  Copyright (c) 2015 Batu Orhanalp. All rights reserved.
//

#import "KTDragButton.h"

@implementation KTDragButton

- (instancetype)initWithDragSize:(CGFloat)dragSize
                      staticSize:(CGFloat)staticSize
                      isVertical:(BOOL)isVertical
{
    CGRect frame = CGRectMake(dragSize/2 - 20, 0, 40, staticSize);
    if (isVertical) {
        frame = CGRectMake(0, dragSize/2 - 20, staticSize, 40);
    }
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        //Creating drag image at the center of dragView
        UIImageView *dragView = [[UIImageView alloc] initWithFrame:CGRectMake(0, staticSize/2 - 20, 40, 40)];
        [dragView setImage:[UIImage imageNamed:@"KTDragButton"]];
        
        //Creating up and down lines
        UIView *lineTopView = [[UIView alloc] initWithFrame:CGRectMake(16, 0, 8, staticSize/2 - 20)];
        [lineTopView setBackgroundColor:[UIColor colorWithRed:96/255.f green:152/255.f blue:206/255.f alpha:1.f]];
        UIView *lineBottomView = [[UIView alloc] initWithFrame:CGRectMake(16, staticSize/2 + 20, 8, staticSize/2 - 20)];
        [lineBottomView setBackgroundColor:[UIColor colorWithRed:96/255.f green:152/255.f blue:206/255.f alpha:1.f]];
        
        //Setting for vertical dragging
        if (isVertical) {
            dragView.frame = CGRectMake(staticSize/2 - 20, 0, 40, 40);
            lineTopView.frame = CGRectMake(0, 16, staticSize/2 - 20, 8);
            lineBottomView.frame = CGRectMake(staticSize/2 + 20, 16, staticSize/2 - 20, 8);
            
            //Rotating drag image for 90 degrees
            dragView.transform = CGAffineTransformMakeRotation(M_PI / 2);
        }
        
        [self addSubview:dragView];
        [self addSubview:lineTopView];
        [self addSubview:lineBottomView];
        
    }
    
    return self;
}

@end
