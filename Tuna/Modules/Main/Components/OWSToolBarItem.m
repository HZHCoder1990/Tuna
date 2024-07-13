//
//  OWSToolBarItem.m
//  Tuna
//
//  Created by 黄智浩 on 2024/7/13.
//

#import "OWSToolBarItem.h"

@interface OWSToolBarItem()
// 图标
@property (strong, nonatomic) UIImageView *barItemIcon;
// 文字
@property (strong, nonatomic) UILabel *barItemText;
// 选中状态
@property (strong, nonatomic) UIView *selectedStatusView;
// 透明按钮
@property (strong, nonatomic) UIButton *transparentButton;
@end

@implementation OWSToolBarItem

- (void)setupViews {
    
    self.backgroundColor = HEXCOLOR(0x666666);
    
    [self addSubview:self.selectedStatusView];
    [self addSubview:self.barItemIcon];
    [self addSubview:self.barItemText];
    [self addSubview:self.transparentButton];
    
    [self.selectedStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.leading.equalTo(self).offset(5);
        make.trailing.equalTo(self).offset(-5);
        make.bottom.equalTo(self).offset(-5);
    }];
    [self.barItemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.centerX.equalTo(self);
        make.width.equalTo(@32);
        make.height.equalTo(@32);
    }];
    [self.barItemText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.barItemIcon.mas_bottom).offset(3);
    }];
    [self.transparentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    // action
    self.transparentButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable * (id<RACSubscriber> subscriber) {
            if (self.barItemTap) {
                self.barItemTap();
            }
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

- (void)setHighLightStatus {
    self.selectedStatusView.hidden = NO;
}

- (void)unSetHighLightStatus {
    self.selectedStatusView.hidden = YES;
}

#pragma mark - lazy load
- (UIImageView *)barItemIcon {
    if (!_barItemIcon) {
        _barItemIcon = [[UIImageView alloc] init];
        _barItemIcon.image = [UIImage imageNamed:@"monkey"];
        _barItemIcon.backgroundColor = [UIColor clearColor];
    }
    return _barItemIcon;
}

- (UILabel *)barItemText {
    if (!_barItemText) {
        _barItemText = [[UILabel alloc] init];
        _barItemText.text = @"首页";
        _barItemText.textColor = HEXCOLOR(0xFFFFFF);
        _barItemText.font = [UIFont systemFontOfSize:12];
        _barItemText.textAlignment = NSTextAlignmentCenter;
        _barItemText.backgroundColor = [UIColor clearColor];
    }
    return _barItemText;
}

- (UIView *)selectedStatusView {
    if (!_selectedStatusView) {
        _selectedStatusView = [[UIView alloc] init];
        _selectedStatusView.backgroundColor = HEXCOLOR(0x222222);
        _selectedStatusView.layer.cornerRadius = 8;
        _selectedStatusView.layer.masksToBounds = YES;
    }
    return _selectedStatusView;
}

- (UIButton *)transparentButton {
    if (!_transparentButton) {
        _transparentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _transparentButton.backgroundColor = [UIColor clearColor];
    }
    return _transparentButton;
}
@end
