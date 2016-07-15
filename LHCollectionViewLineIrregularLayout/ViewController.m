//
//  ViewController.m
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/13/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateLineIrregularLayout>

@property (nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"视觉呈现";
    
    [self.view addSubview:self.collectionView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.collectionView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UILabel *contentLabel = [UILabel new];
    contentLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    contentLabel.font = [UIFont systemFontOfSize:14.0];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.layer.borderWidth = 2.0;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.backgroundView = contentLabel;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateLineIrregularLayout
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    if (indexPath.row%2) {
        height = 135;
    }
    else {
        height = 185;
    }
    
    return height;

}

#pragma mark - Getter and Setter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        LHCollectionViewLineIrregularLayout *collectionViewLineIrregularLayout = [LHCollectionViewLineIrregularLayout new];
        collectionViewLineIrregularLayout.columnWidth = 80.0;
        collectionViewLineIrregularLayout.interitemSpacing = 20.0;
        collectionViewLineIrregularLayout.verticalInteritemSpacing = 20.0;
        collectionViewLineIrregularLayout.collectionViewLineIrregularLayoutStyle = self.collectionViewLineIrregularLayoutStyle;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:collectionViewLineIrregularLayout];
        _collectionView.backgroundColor = [UIColor blueColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}

@end
