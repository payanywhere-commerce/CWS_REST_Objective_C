//
//  AppDelegate.h
//  gizmosdk
//
//  Created by Einar Vollset on 3/19/12.
//  Copyright (c) 2012 Left Coast R&D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
