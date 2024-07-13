//
//  OWSGlobalBottomToolBar.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSGlobalBottomToolBar.h"
#import "OWSToolBarItem.h"

@interface OWSGlobalBottomToolBar()
@property (strong, nonatomic) UIView *toolBarView;
@property (strong, nonatomic) NSMutableArray *mutableItems;
@end

@implementation OWSGlobalBottomToolBar
- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.toolBarView];
    
    self.mutableItems = @[].mutableCopy;
    OWSToolBarItem *homeItem = [[OWSToolBarItem alloc] init];
    homeItem.barItemTap = ^{
        [self doNextTap:0];
    };
    [self.toolBarView addSubview:homeItem];
    OWSToolBarItem *gameItem = [[OWSToolBarItem alloc] init];
    gameItem.barItemTap = ^{
        [self doNextTap:1];
    };
    [self.toolBarView addSubview:gameItem];
    OWSToolBarItem *profileItem = [[OWSToolBarItem alloc] init];
    profileItem.barItemTap = ^{
        [self doNextTap:2];
    };
    [self.toolBarView addSubview:profileItem];
    [self.mutableItems addObject:homeItem];
    [self.mutableItems addObject:gameItem];
    [self.mutableItems addObject:profileItem];
    
    [self.mutableItems mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.mutableItems mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.toolBarView);
    }];
}

- (void)doNextTap:(NSInteger)index {
    if (self.selectedTap) {
        self.selectedTap(index);
    }
}

- (void)changeStatusForIndex:(NSInteger)index {
    // 选中高亮，其余取消
    for (NSInteger i = 0; i < self.mutableItems.count; i ++) {
        OWSToolBarItem *barItem = [self.mutableItems objectAtIndex:i];
        if (index == i) {
            [barItem setHighLightStatus];
        } else {
            [barItem unSetHighLightStatus];
        }
    }
}

#pragma mark - lazy load
- (UIView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [[UIView alloc] initWithFrame:CGRectMake(OWSGlobalBottomToolBarLeadingSpace, 0, OWSScreenWidth - OWSGlobalBottomToolBarLeadingSpace * 2, OWSGlobalBottomToolBarHeight)];
        _toolBarView.backgroundColor = HEXCOLOR(0x666666);
        _toolBarView.layer.cornerRadius = 15;
        _toolBarView.layer.masksToBounds = YES;
    }
    return _toolBarView;
}
@end
