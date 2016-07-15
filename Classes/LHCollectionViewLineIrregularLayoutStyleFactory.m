//
//  LHCollectionViewLineIrregularLayoutStyleFactory.m
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import "LHCollectionViewLineIrregularLayoutNormalStyle.h"

#import "LHCollectionViewLineIrregularLayoutStyleFactory.h"

@implementation LHCollectionViewLineIrregularLayoutStyleFactory

+ (LHCollectionViewLineIrregularLayoutStyleBase *)creatorWithStyle:(LHCollectionViewLineIrregularLayoutStyle)style
{
    LHCollectionViewLineIrregularLayoutStyleBase *collectionViewLineIrregularLayoutStyle;
    switch (style) {
        case LHCollectionViewLineIrregularLayoutDefault:
            collectionViewLineIrregularLayoutStyle = [LHCollectionViewLineIrregularLayoutStyleBase new];
            break;
        case LHCollectionViewLineIrregularLayoutNormal:
            collectionViewLineIrregularLayoutStyle = [LHCollectionViewLineIrregularLayoutNormalStyle new];
            break;
        default:
            @throw @"Need implement";
            break;
    }
    
    return collectionViewLineIrregularLayoutStyle;
}

@end
