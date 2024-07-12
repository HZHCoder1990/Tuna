//
//  OWSBaseView.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSBaseView.h"

@implementation OWSBaseView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = OWSThemeColor;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    // 子类重写
}
@end
