//
//  OWSGlobalBottomToolBar.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSGlobalBottomToolBar.h"

@interface OWSGlobalBottomToolBar()
@property (strong, nonatomic) UIView *toolBarView;
@property (strong, nonatomic) UIStackView *containerView;
@end

@implementation OWSGlobalBottomToolBar
- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.toolBarView];
    [self.toolBarView addSubview:self.containerView];
    
    // 先随便加三个按钮
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"首页" forState:UIControlStateNormal];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor greenColor];
    [btn2 setTitle:@"游戏" forState:UIControlStateNormal];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.backgroundColor = [UIColor blueColor];
    [btn3 setTitle:@"我的" forState:UIControlStateNormal];
    
    [self.containerView addArrangedSubview:btn1];
    [self.containerView addArrangedSubview:btn2];
    [self.containerView addArrangedSubview:btn3];
}

#pragma mark - lazy load
- (UIView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [[UIView alloc] initWithFrame:CGRectMake(OWSGlobalBottomToolBarLeadingSpace, 0, OWSScreenWidth - OWSGlobalBottomToolBarLeadingSpace * 2, OWSGlobalBottomToolBarHeight)];
        _toolBarView.backgroundColor = HEXCOLOR(0xFF0000);
        _toolBarView.layer.cornerRadius = 15;
        _toolBarView.layer.masksToBounds = YES;
    }
    return _toolBarView;
}

- (UIStackView *)containerView {
    if (!_containerView) {
        _containerView = [[UIStackView alloc] initWithFrame:self.toolBarView.bounds];
        _containerView.axis = UILayoutConstraintAxisHorizontal;
        _containerView.distribution = UIStackViewDistributionFillEqually;
        _containerView.alignment = UIStackViewAlignmentFill;
    }
    return _containerView;
}
@end
