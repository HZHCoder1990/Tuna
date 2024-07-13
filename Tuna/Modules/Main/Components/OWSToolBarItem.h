//
//  OWSToolBarItem.h
//  Tuna
//
//  Created by 黄智浩 on 2024/7/13.
//

#import "OWSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface OWSToolBarItem : OWSBaseView
@property (copy, nonatomic) void(^barItemTap)(void);
- (void)setHighLightStatus;
- (void)unSetHighLightStatus;
@end

NS_ASSUME_NONNULL_END
