//
//  ViewController.m
//  BMSearch
//
//  Created by Jashion on 2017/11/29.
//  Copyright © 2017年 BMu. All rights reserved.
//

#import "ViewController.h"
#import "BMSearchView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (IBAction)openSearch:(id)sender {
    BMSearchView *searchView = [[BMSearchView alloc] initWithPlaceholderText: @"电影搜索"];
    [searchView openSearch];
}

@end
