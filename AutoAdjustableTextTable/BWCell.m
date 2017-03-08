//
//  BWCell.m
//  AutoAdjustableTextTable
//
//  Created by Wanqiao Wu on 2017-03-08.
//  Copyright © 2017 Wanqiao Wu. All rights reserved.
//

#import "BWCell.h"

@implementation BWCell
@synthesize title, defaultContent, type, options;

- (id)initWithTitle:(NSString *)cellTitle DefaultContent:(NSString *)cellDefaultContent Type:(int)cellType Options:(NSArray *)cellOptions {
    self = [super init];
    if (self) {
        title = cellTitle;
        defaultContent = cellDefaultContent;
        type = cellType;
        options = cellOptions;
    }
    return self;
}

@end
