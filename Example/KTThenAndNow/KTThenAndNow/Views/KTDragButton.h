//
//  KTDragButton.h
//  KTThenAndNow
//
//  Created by Batu Orhanalp on 25/07/15.
//  Copyright (c) 2015 Batu Orhanalp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTDragButton : UIView

- (instancetype)initWithDragSize:(CGFloat)dragSize
                      staticSize:(CGFloat)staticSize
                      isVertical:(BOOL)isVertical;

@end
