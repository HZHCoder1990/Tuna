//
//  OWSMainViewController.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSMainViewController.h"
#import "OWSGlobalBottomToolBar.h"
#import "OWSProfileViewController.h"
#import "OWSGameViewController.h"
#import "OWSHomeViewController.h"

@interface OWSMainViewController ()
@property (strong, nonatomic) OWSGlobalBottomToolBar *bottomToolBar;
@end

@implementation OWSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews {
    
    self.tabBar.hidden = YES;
    
    // 添加子控制器
    OWSHomeViewController *homeViewController = [[OWSHomeViewController alloc] init];
    OWSGameViewController *gameViewController = [[OWSGameViewController alloc] init];
    OWSProfileViewController *profileViewController = [[OWSProfileViewController alloc] init];
    [self addChildViewController:homeViewController];
    [self addChildViewController:gameViewController];
    [self addChildViewController:profileViewController];
    
    self.selectedIndex = 1;
    
    [self.view addSubview:self.bottomToolBar];
    [self.bottomToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.height.equalTo(@(OWSGlobalBottomToolBarHeight));
    }];

}

- (OWSGlobalBottomToolBar *)bottomToolBar {
    if (!_bottomToolBar) {
        _bottomToolBar = [[OWSGlobalBottomToolBar alloc] init];
    }
    return _bottomToolBar;
}

@end
