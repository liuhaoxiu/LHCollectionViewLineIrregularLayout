//
//  LHCollectionViewLineIrregularLayout.m
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#include <objc/message.h>

#import "LHCollectionViewLineIrregularLayoutStyleBase.h"
#import "LHCollectionViewLineIrregularLayoutStyleFactory.h"

#import "LHCollectionViewLineIrregularLayout.h"

@interface LHCollectionViewLineIrregularLayout ()

@property (nonatomic) NSDictionary *layoutInformation;
@property (nonatomic) LHCollectionViewLineIrregularLayoutStyleBase *layoutStyle;
@property (nonatomic) CGFloat collectionViewWidth;

@end

@implementation LHCollectionViewLineIrregularLayout

#pragma mark - Override
- (void)prepareLayout
{
    [super prepareLayout];
    
    NSMutableDictionary *cellInformation = [NSMutableDictionary dictionary];
    NSIndexPath *indexPath;
    NSInteger numItems = [self.collectionView numberOfItemsInSection:0];
    for(NSInteger item = 0; item < numItems; item++){
        indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = [self frameForCellAtIndexPath:indexPath];
        
        [cellInformation setObject:attributes forKey:indexPath];
    }
    
    self.layoutInformation = [cellInformation copy];
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionViewWidth, self.layoutStyle.canvasHeight);
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *myAttributes = [NSMutableArray arrayWithCapacity:self.layoutInformation.count];
    for(NSIndexPath *key in self.layoutInformation.allKeys){
        UICollectionViewLayoutAttributes *attributes =
        [self.layoutInformation objectForKey:key];
        if(CGRectIntersectsRect(rect, attributes.frame)){
            [myAttributes addObject:attributes];
        }
    }
    return myAttributes;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.layoutInformation[indexPath];
}

#pragma mark - Private Methods
- (CGRect)frameForCellAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0.0;
    if ([self.collectionView.delegate conformsToProtocol:@protocol(UICollectionViewDelegateLineIrregularLayout)]) {
        if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:heightForItemAtIndexPath:)]) {
            CGFloat height = ((CGFloat(*)(id, SEL, UICollectionView *,LHCollectionViewLineIrregularLayout *, NSIndexPath *))objc_msgSend)(self.collectionView.delegate, @selector(collectionView:layout:heightForItemAtIndexPath:), self.collectionView, self, indexPath);
            cellHeight = height;
        }
    }
    
    return [self.layoutStyle layoutWithCellHeight:cellHeight];
}

#pragma mark - Getter and Setter
- (LHCollectionViewLineIrregularLayoutStyleBase *)layoutStyle
{
    if (!_layoutStyle) {
        _layoutStyle = [LHCollectionViewLineIrregularLayoutStyleFactory creatorWithStyle:self.collectionViewLineIrregularLayoutStyle];
        _layoutStyle.canvasWidth = self.collectionViewWidth;
        _layoutStyle.columnWidth = self.columnWidth;
        _layoutStyle.interitemSpacing = self.interitemSpacing;
        _layoutStyle.verticalInteritemSpacing = self.verticalInteritemSpacing;
    }
    return _layoutStyle;
}

- (CGFloat)columnWidth
{
    if (_columnWidth > self.collectionViewWidth) {
        _columnWidth = self.collectionViewWidth;
    }
    return _columnWidth;
}

- (CGFloat)collectionViewWidth
{
    _collectionViewWidth = self.collectionView.bounds.size.width;
    
    return _collectionViewWidth;
}

@end
