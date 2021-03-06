//
//  BWAdjustableTextTable.h
//  quupe
//
//  Created by Wanqiao Wu on 2016-11-18.
//  Copyright © 2016 Wanqiao Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextTableCell.h"
#import "TextCellData.h"
#import "BWCell.h"

@protocol BWAdjustableTextTableDelegate <NSObject>

@required
- (void)changeScrollViewContentSizeBy:(CGFloat)tableViewChangedHeight NewTableHeight:(CGFloat)newTableViewHeight;
- (void)setScrollViewContentYOffset:(CGFloat)yOffset WithKeyboardHeight:(CGFloat)keyboardHeight;
- (void)resetScrollViewContentOffset;
- (void)updateRelatedElementsInScrollView;

@end

@interface BWAdjustableTextTable : UITableView <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource,TextTableCellDelegate>

@property (weak, nonatomic) id<BWAdjustableTextTableDelegate> scrollDelegate;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

- (id)initWithWidth:(CGFloat)width PositionY:(CGFloat)positionY Data:(NSArray *)dataArray;
- (NSArray *)stopEditingAndReturnCellData;

@end
