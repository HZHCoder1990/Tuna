//
//  OWSGlobalBottomToolBar.h
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OWSGlobalBottomToolBar : OWSBaseView
@property (copy, nonatomic) void(^selectedTap)(NSInteger index);
- (void)changeStatusForIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
