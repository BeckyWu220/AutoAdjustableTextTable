//
//  ViewController.m
//  AutoAdjustableTextTable
//
//  Created by Wanqiao Wu on 2017-03-08.
//  Copyright © 2017 Wanqiao Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *scrollView;
    CGSize currentScrollContentSize;
    BWAdjustableTextTable *textTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.scrollEnabled = YES;
    currentScrollContentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height+64.0f + 100.0f);
    scrollView.contentSize = currentScrollContentSize;
    
    [self.view addSubview:scrollView];
    
    textTableView = [[BWAdjustableTextTable alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2) Data:[NSArray arrayWithObjects:@[@"Name", @"Not Specified", [NSNumber numberWithInteger:HORIZONTAL_TEXT_TYPE]], @[@"Email", @"Not Specified", [NSNumber numberWithInteger:HORIZONTAL_TEXT_TYPE]],
        @[@"Phone", @"Not Specified", [NSNumber numberWithInteger:HORIZONTAL_TEXT_TYPE]],
        @[@"Address", @"Not Specified", [NSNumber numberWithInteger:HORIZONTAL_TEXT_TYPE]],
        @[@"Birthday", @"Not Specified", [NSNumber numberWithInteger:HORIZONTAL_DATEPICKER_TYPE]],
        @[@"Job", @"Not Specified", [NSNumber numberWithInteger:HORIZONTAL_UIPICKER_TYPE], @[@"Programmer", @"Artist", @"Designer"]], nil]];
    
    textTableView.scrollDelegate = self;
    [scrollView addSubview:textTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma BWAdjustableTextTableDelegate
- (void)changeScrollViewContentSizeBy:(CGFloat)tableViewChangedHeight NewTableHeight:(CGFloat)newTableViewHeight
{
    currentScrollContentSize = CGSizeMake(currentScrollContentSize.width, currentScrollContentSize.height - tableViewChangedHeight);
    scrollView.contentSize = currentScrollContentSize;
}

- (void)setScrollViewContentYOffset:(CGFloat)yOffset WithKeyboardHeight:(CGFloat)keyboardHeight
{
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0, 0, keyboardHeight, 0);
    
    scrollView.contentSize = CGSizeMake(scrollView.contentSize.width, scrollView.contentSize.height + yOffset);
    scrollView.contentInset = contentInsets;
    scrollView.contentOffset = CGPointMake(0, yOffset);
    scrollView.scrollIndicatorInsets = contentInsets;
    scrollView.scrollEnabled = YES;
}

- (void)resetScrollViewContentOffset
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.contentOffset = CGPointZero;
    scrollView.scrollIndicatorInsets = contentInsets;
    scrollView.contentSize = currentScrollContentSize;
}

- (void)updateRelatedElementsInScrollViewWithCell:(TextTableCell *)cell
{
    //do nothing.
}


@end
