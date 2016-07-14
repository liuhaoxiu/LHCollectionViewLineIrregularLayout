//
//  LHCollectionViewLineIrregularLayout.h
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LHCollectionViewLineIrregularLayoutStyle)
{
    LHCollectionViewLineIrregularLayoutDefault = 0, // 通过线性布局，一行占满就开启另外一行排布，总是按数据顺序从左到右排列.
    LHCollectionViewLineIrregularLayoutNormal, // 通过线性布局，一行占满就开启另外一行排布，每一行都是先从最短列下面放置起，所以不一定是按从左到右排列.
};

@protocol UICollectionViewDelegateLineIrregularLayout <UICollectionViewDelegate>
@optional

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LHCollectionViewLineIrregularLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) CGFloat verticalInteritemSpacing;
@property (nonatomic, assign) CGFloat columnWidth;
@property (nonatomic, assign) LHCollectionViewLineIrregularLayoutStyle collectionViewLineIrregularLayoutStyle;

@end
