//
//  BMSearchView.h
//  BMSearch
//
//  Created by Jashion on 2017/11/29.
//  Copyright © 2017年 BMu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMSearchView : UIView

@property (nonatomic, strong) NSArray *recentlyToCinemas;
@property (nonatomic, strong) NSArray *nearbyCinemas;

- (instancetype)initWithPlaceholderText: (NSString *)placeholderText;
- (void)openSearch;
- (void)cancelSearch;

@end
