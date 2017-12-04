//
//  BMSearchView.m
//  BMSearch
//
//  Created by Jashion on 2017/11/29.
//  Copyright © 2017年 BMu. All rights reserved.
//

#import "BMSearchView.h"

#define STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface BMSearchView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSString *placeholderText;
@property (nonatomic, strong) UITextField *searchBar;
@property (nonatomic, strong) UIButton *cancel;
@property (nonatomic, strong) UITableView *searchInfoTableView;
@property (nonatomic, strong) UITableView *searchResultTableView;

@end

@implementation BMSearchView

- (instancetype)initWithPlaceholderText: (NSString *)placeholderText {
    if (self = [super initWithFrame: [UIScreen mainScreen].bounds]) {
        _placeholderText = placeholderText;
        self.backgroundColor = [UIColor whiteColor];
        [self build];
    }
    return self;
}

- (void)build {
    _searchBar = [[UITextField alloc] initWithFrame: CGRectMake(15, STATUSBAR_HEIGHT + 7, SCREEN_WIDTH - 105, 30)];
    _searchBar.delegate = self;
    _searchBar.placeholder = self.placeholderText;
    [self addSubview: _searchBar];
    
    _cancel = [UIButton buttonWithType: UIButtonTypeCustom];
    _cancel.frame = CGRectMake(SCREEN_WIDTH - 75, STATUSBAR_HEIGHT + 7, 60, 30);
    _cancel.titleLabel.textColor = [UIColor blackColor];
    _cancel.titleLabel.font = [UIFont systemFontOfSize: 15];
    [_cancel setTitle: @"取消" forState: UIControlStateNormal];
    [self addSubview: _cancel];
    
//    [self addSubview: self.searchInfoTableView];
}

#pragma mark - Public methods
- (void)openSearch {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview: self];
}

- (void)cancelSearch {
    [self removeFromSuperview];
}

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - UISearchBarDelegate

#pragma mark - Setter and Getter
- (UITableView *)searchInfoTableView {
    if (!_searchInfoTableView) {
        _searchInfoTableView = [[UITableView alloc] initWithFrame: CGRectMake(0, STATUSBAR_HEIGHT, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - STATUSBAR_HEIGHT) style: UITableViewStyleGrouped];
        _searchInfoTableView.delegate = self;
        _searchInfoTableView.dataSource = self;
        _searchInfoTableView.scrollsToTop = YES;
        _searchInfoTableView.showsVerticalScrollIndicator = NO;
        _searchInfoTableView.showsHorizontalScrollIndicator = NO;
        _searchInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _searchInfoTableView;
}

- (UITableView *)searchResultTableView {
    if (!_searchResultTableView) {
        _searchResultTableView = [[UITableView alloc] initWithFrame: CGRectMake(0, STATUSBAR_HEIGHT, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - STATUSBAR_HEIGHT) style: UITableViewStyleGrouped];
        _searchResultTableView.delegate = self;
        _searchResultTableView.dataSource = self;
        _searchResultTableView.scrollsToTop = YES;
        _searchResultTableView.showsVerticalScrollIndicator = NO;
        _searchResultTableView.showsHorizontalScrollIndicator = NO;
        _searchResultTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _searchResultTableView;
}


@end
