//
//  PageViewDataSource.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "ContentViewController.h"
#import "ContentController.h"
#import "PageViewDataSource.h"

@implementation PageViewDataSource

- (UIViewController *)setViewControllerAtIndex:(NSInteger)index
{
    if (index < 0 || index >= [ContentController sharedInstance].content.count) {
        return nil;
    }
    ContentViewController *viewController = [ContentViewController new];
    viewController.index = index;
    viewController.name = [[ContentController sharedInstance].content[index] description];
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger beforeIndex = ((ContentViewController *)viewController).index - 1;
    return [self setViewControllerAtIndex:beforeIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger afterIndex = ((ContentViewController *)viewController).index + 1;
    return [self setViewControllerAtIndex:afterIndex];
}

@end
