//
//  OWSBaseViewController.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSBaseViewController.h"
#import "OWSDefine.h"

@interface OWSBaseViewController ()

@end

@implementation OWSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = OWSThemeColor;
    [self setupViews];
}

- (void)setupViews {
    // 子类实现
}

@end
