//
//  ViewController.m
//  KTThenAndNow
//
//  Created by Batu Orhanalp on 22/07/15.
//  Copyright (c) 2015 Batu Orhanalp. All rights reserved.
//

#import "ViewController.h"
#import "KTThenAndNowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    KTThenAndNowView *thenAndNowView = [[KTThenAndNowView alloc] initWithFrame:CGRectMake(25, 100, 667, 250)
                                                                    firstImage:[UIImage imageNamed:@"image1"]
                                                                   secondImage:[UIImage imageNamed:@"image2"]
                                                                    isVertical:NO];
    [self.view addSubview:thenAndNowView];
    
    KTThenAndNowView *thenAndNowVerticalView = [[KTThenAndNowView alloc] initWithFrame:CGRectMake(25, 400, 667, 250)
                                                                    firstImage:[UIImage imageNamed:@"image1"]
                                                                   secondImage:[UIImage imageNamed:@"image2"]
                                                                    isVertical:YES];
    [self.view addSubview:thenAndNowVerticalView];
    
    /*
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(25, 400, 667, 250)];
    [view setImage:[UIImage imageNamed:@"image1"]];
    [self.view addSubview:view];
    
    UIImageView *view2 = [[UIImageView alloc] initWithFrame:CGRectMake(25, 700, 667, 250)];
    [view2 setImage:[UIImage imageNamed:@"image2"]];
    [self.view addSubview:view2];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
