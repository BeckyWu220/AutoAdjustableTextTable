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
    UIButton *doneBtn;
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
    
    textTableView = [[BWAdjustableTextTable alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2) Data:[NSArray arrayWithObjects:[[BWCell alloc] initWithTitle:@"Name" DefaultContent:@"Not Specified" Type:HORIZONTAL_TEXT_TYPE Options:nil], [[BWCell alloc] initWithTitle:@"Email" DefaultContent:@"Not Specified" Type:HORIZONTAL_TEXT_TYPE Options:nil], [[BWCell alloc] initWithTitle:@"Job" DefaultContent:@"Not Specified" Type:HORIZONTAL_UIPICKER_TYPE Options:@[@"Programmer", @"Artist", @"Designer"]], [[BWCell alloc] initWithTitle:@"Employed From" DefaultContent:@"Not Specified" Type:VERTICAL_DATEPICKER_TYPE Options:nil], nil]];

    textTableView.scrollDelegate = self;
    [scrollView addSubview:textTableView];
    
    doneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, textTableView.frame.origin.y+textTableView.frame.size.height, [[UIScreen mainScreen] bounds].size.width, 35.0f)];
    doneBtn.backgroundColor = [UIColor colorWithRed:67.0/255.0f green:169.0/255.0f blue:242.0/255.0f alpha:1.0f];
    [doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    [doneBtn addTarget:self action:@selector(clickDoneBtn) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:doneBtn];
}

- (void)clickDoneBtn
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Reminder" message:@"This button illustrates how the following elements' positions are updated as table size changes." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
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

- (void)updateRelatedElementsInScrollView
{
    //If there's any UI elements appear under textTableView, it's position need to be adjusted here according to the height of textTableView changes.
    doneBtn.frame = CGRectMake(0, textTableView.frame.origin.y + textTableView.frame.size.height + 10.0f, [[UIScreen mainScreen] bounds].size.width, 35.0f);
}


@end
