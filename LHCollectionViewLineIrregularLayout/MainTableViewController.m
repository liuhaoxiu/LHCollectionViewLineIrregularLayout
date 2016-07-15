//
//  MainTableViewController.m
//  LHCollectionViewLineIrregularLayout
//
//  Created by liuhao on 7/15/16.
//  Copyright © 2016 liuhao. All rights reserved.
//

#import "LHCollectionViewLineIrregularLayout.h"

#import "MainTableViewController.h"
#import "ViewController.h"

@implementation MainTableViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"样式可选";
    
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
        case LHCollectionViewLineIrregularLayoutDefault:
            cell.textLabel.text = @"总是按数据顺序从左到右排列";
            break;
        case LHCollectionViewLineIrregularLayoutNormal:
            cell.textLabel.text = @"每一行都是先从最短列下面放置起";
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *vC = [ViewController new];
    switch (indexPath.row) {
        case LHCollectionViewLineIrregularLayoutDefault:
            vC.collectionViewLineIrregularLayoutStyle = LHCollectionViewLineIrregularLayoutDefault;
            break;
        case LHCollectionViewLineIrregularLayoutNormal:
            vC.collectionViewLineIrregularLayoutStyle = LHCollectionViewLineIrregularLayoutNormal;
            break;
        default:
            vC.collectionViewLineIrregularLayoutStyle = LHCollectionViewLineIrregularLayoutDefault;
            break;
    }
    
    [self.navigationController pushViewController:vC animated:YES];
}


@end
