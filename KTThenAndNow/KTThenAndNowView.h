//
//  KTThenAndNowView.h
//  KTThenAndNow
//
//  Created by Batu Orhanalp on 22/07/15.
//  Copyright (c) 2015 Batu Orhanalp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTThenAndNowView : UIView

@property (nonatomic, retain) UIImage *firstImage;
@property (nonatomic, retain) UIImage *secondImage;
@property (nonatomic) BOOL isVertical;

- (instancetype)initWithFrame:(CGRect)frame
                   firstImage:(UIImage *)firstImage
                  secondImage:(UIImage *)secondImage
                   isVertical:(BOOL)isVertical;

@end
