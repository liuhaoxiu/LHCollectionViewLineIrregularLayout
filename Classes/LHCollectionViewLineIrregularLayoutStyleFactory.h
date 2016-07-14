//
//  LHCollectionViewLineIrregularLayoutStyleFactory.h
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LHCollectionViewLineIrregularLayoutStyleBase.h"
#import "LHCollectionViewLineIrregularLayout.h"

@interface LHCollectionViewLineIrregularLayoutStyleFactory : NSObject

+ (LHCollectionViewLineIrregularLayoutStyleBase *)creatorWithStyle:(LHCollectionViewLineIrregularLayoutStyle)style;

@end
