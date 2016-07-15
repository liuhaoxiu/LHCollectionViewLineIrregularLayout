//
//  LHCollectionViewLineIrregularLayoutStyle.h
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHCollectionViewLineIrregularLayoutStyleBase : NSObject

//画布宽度(这个值是需要提供)
@property (nonatomic) CGFloat canvasWidth;
//画布高度（为计算完后的最终高度值）
@property (nonatomic, readonly) CGFloat canvasHeight;
//列宽是固定的，因为想要避免列不失真而因为高度是不固定的，为了避免自动计算效率损失，这个按宽等比缩放由外部提供.
@property (nonatomic) CGFloat columnWidth;
@property (nonatomic) CGFloat interitemSpacing;
@property (nonatomic) CGFloat verticalInteritemSpacing;
//列总数
@property (nonatomic, readonly) NSUInteger columnsTotal;
//当前列索引，default value -1
@property (nonatomic) NSInteger currentlyColumnIndex;
//存储了每列的高度值
@property (nonatomic, readonly) NSMutableArray *columnsHeight;

- (CGRect)layoutWithCellHeight:(CGFloat)cellHeight;

@end
