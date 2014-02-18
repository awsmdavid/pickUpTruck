//
//  AppDelegate.h
//  pickUpTruck
//
//  Created by David Cheng on 5/17/13.
//  Copyright (c) 2013 David Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    ADBannerView *adView;
    BOOL bannerIsVisible;
}

@property (nonatomic, assign) BOOL bannerIsVisible;

@property (strong, nonatomic) UIWindow *window;

@end
