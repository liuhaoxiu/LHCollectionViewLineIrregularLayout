//
//  LHCollectionViewLineIrregularLayoutNormalStyle.m
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import "LHCollectionViewLineIrregularLayoutNormalStyle.h"

@implementation LHCollectionViewLineIrregularLayoutNormalStyle

#pragma mark - Override
- (CGRect)layoutWithCellHeight:(CGFloat)cellHeight
{
    self.currentlyColumnIndex = [self findShortestColumnIndex];
    CGFloat currentlyColumnHeight = [self.columnsHeight[self.currentlyColumnIndex] floatValue];
    
    CGFloat cellX = self.columnWidth * self.currentlyColumnIndex + (self.currentlyColumnIndex * self.interitemSpacing);
    CGFloat cellY = currentlyColumnHeight + (currentlyColumnHeight ? self.verticalInteritemSpacing : 0.0);
    
    //保存当前列高度
    self.columnsHeight[self.currentlyColumnIndex] = @(cellY + cellHeight);
    
    return CGRectMake(cellX, cellY, self.columnWidth, cellHeight);
    return CGRectZero;
}

#pragma mark - Private Methods
- (NSUInteger)findShortestColumnIndex
{
    NSUInteger shortestColumnIndex = 0;
    CGFloat shortestColumnHeight = MAXFLOAT;
    
    NSUInteger columnIndex=0;
    for (NSNumber *height in self.columnsHeight) {
        if ([height floatValue] < shortestColumnHeight) {
            shortestColumnHeight = [height floatValue];
            shortestColumnIndex = columnIndex;
        }
        columnIndex++;
    }
    
    return shortestColumnIndex;
}

@end
