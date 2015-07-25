# KTThenAndNow

A tool to show differences between two images.

![KTThenAndNowView](http://i.imgur.com/03DeGkX.gif)

## Requirements

iOS 7.0


## Usage

First import KTThenAndNowView.h to your controller

> #import KTThenAndNowView.h

And create a KTThenAndNowView with code below.

> KTThenAndNowView *thenAndNowView = [[KTThenAndNowView alloc] initWithFrame:frame
>firstImage:[UIImage imageNamed:@"image1"]
>secondImage:[UIImage imageNamed:@"image2"]
>isVertical:NO];
>[self.view addSubview:thenAndNowView];

