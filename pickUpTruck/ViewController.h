//
//  ViewController.h
//  pickUpTruck
//
//  Created by David Cheng on 5/17/13.
//  Copyright (c) 2013 David Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <iAd/iAd.h>

#import "GADBannerView.h"


@interface ViewController : UIViewController <ADBannerViewDelegate>{

}
@property (nonatomic, strong) ADBannerView *bannerView;
@property (nonatomic, strong) GADBannerView *admobBannerView;

@end
