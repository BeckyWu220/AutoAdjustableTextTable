//
//  BWCell.h
//  AutoAdjustableTextTable
//
//  Created by Wanqiao Wu on 2017-03-08.
//  Copyright © 2017 Wanqiao Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWCell : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *defaultContent;
@property int type;
@property (strong, nonatomic) NSArray *options;

- (id)initWithTitle:(NSString *)cellTitle DefaultContent:(NSString *)cellDefaultContent Type:(int)cellType Options:(NSArray *)cellOptions;
@end
