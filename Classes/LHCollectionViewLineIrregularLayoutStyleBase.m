//
//  LHCollectionViewLineIrregularLayoutStyle.m
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import "LHCollectionViewLineIrregularLayoutStyleBase.h"

@interface LHCollectionViewLineIrregularLayoutStyleBase ()

//画布高度，在布局数据未计算完时值为当前伸展的画布高度
@property (nonatomic) CGFloat canvasHeight;
//存储了每列的高度值
@property (nonatomic) NSMutableArray *columnsHeight;
//列总数
@property (nonatomic, assign) NSUInteger columnsTotal;

@end

@implementation LHCollectionViewLineIrregularLayoutStyleBase

#pragma mark - Life Cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentlyColumnIndex = -1;
    }
    return self;
}

#pragma mark - Public Methods
- (CGRect)layoutWithCellHeight:(CGFloat)cellHeight
{
    [self nextColumnIndex];
    CGFloat currentlyColumnHeight = [self.columnsHeight[self.currentlyColumnIndex] floatValue];
    
    CGFloat cellX = self.columnWidth * self.currentlyColumnIndex + (self.currentlyColumnIndex * self.interitemSpacing);
    CGFloat cellY = currentlyColumnHeight + (currentlyColumnHeight ? self.verticalInteritemSpacing : 0.0);
    
    //保存当前列高度
    self.columnsHeight[self.currentlyColumnIndex] = @(cellY + cellHeight);
    
    return CGRectMake(cellX, cellY, self.columnWidth, cellHeight);
}

#pragma mark - Private Methods
- (void)nextColumnIndex
{
    if (_currentlyColumnIndex == (self.columnsTotal - 1)) {
        _currentlyColumnIndex = -1;
    }
    _currentlyColumnIndex++;
}

#pragma mark - Getter and Setter
- (NSMutableArray *)columnsHeight
{
    if (!_columnsHeight) {
        _columnsHeight = [[NSMutableArray alloc] initWithCapacity:self.columnsTotal];
        for (NSInteger i = 0; i < self.columnsTotal; i++) {
            [_columnsHeight addObject:@(0)];
        }
    }
    return _columnsHeight;
}

- (NSUInteger)columnsTotal
{
    if (!_columnsTotal) {
        CGFloat tempWidth = self.columnWidth;
        while (self.canvasWidth >= tempWidth) {
            tempWidth += self.columnWidth + self.interitemSpacing;
            _columnsTotal++;
        }
    }
    return _columnsTotal;
}

- (CGFloat)canvasHeight
{
    for(NSNumber *height in self.columnsHeight)
    {
        if ([height floatValue] > _canvasHeight) {
            _canvasHeight = [height floatValue];
        }
    }
    return _canvasHeight;
}


@end
