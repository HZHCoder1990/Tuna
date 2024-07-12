//
//  OWSRotationView.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSRotationView.h"

@interface OWSRotationView()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *rotatingView;
@end

@implementation OWSRotationView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.rotatingView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(frame) - 200) / 2, (CGRectGetHeight(frame)- 200) / 2, 200, 200)];
        self.rotatingView.backgroundColor = [UIColor blueColor];
        self.rotatingView.layer.cornerRadius = 100;
        self.rotatingView.layer.masksToBounds = YES;
        [self addSubview:self.rotatingView];
        
        UIView *innerView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 160, 160)];
        innerView.backgroundColor = [UIColor redColor];
        innerView.layer.cornerRadius = 80;
        innerView.layer.masksToBounds = YES;
        [self.rotatingView addSubview:innerView];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    CGFloat middleX = CGRectGetWidth(self.frame) / 2;
    CGFloat middleY = CGRectGetHeight(self.frame) / 2;
    // 中心点
    CGPoint centerPoint = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
    CGFloat x = touchPoint.x - centerPoint.x;
    CGFloat y = touchPoint.y - centerPoint.y;
    // 距离中心点的距离
    CGFloat length = sqrt(x * x + y * y);
    
    // 整个视图的最远距离
    CGFloat maxLength = sqrt(middleX * middleX + middleY * middleY);
    
    // 比例
    CGFloat ratio = length / maxLength;
    
    // 计算夹角
    CGFloat angle = atan2(y, x);
    
    // 沿着什么轴
    CGFloat axiosY = sin(angle + M_PI_2);
    CGFloat axiosX = cos(angle + M_PI_2);
    
    // 旋转的角度 => 距离中心点越远，角度越大
    CGFloat rotationAngle = ratio * M_PI / 4;
    
    [self apply3DRotationToView:self.rotatingView withAngle:rotationAngle x:axiosX y:axiosY z:0];
    
    // 产生飘动的视图    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(touchPoint.x, touchPoint.y, 10, 10)];
    tempView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.9];
    tempView.layer.cornerRadius = 5;
    tempView.layer.masksToBounds = YES;
    [self addSubview:tempView];
    
    [self addMoveAndFadeAnimationToView:tempView startPoint:CGPointMake(touchPoint.x, 0)];
}

// 松手
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 恢复形状
    self.rotatingView.layer.transform = CATransform3DIdentity;
}

- (void)addMoveAndFadeAnimationToView:(UIView *)view startPoint:(CGPoint)startPoint {
    // 创建位置动画
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:view.layer.position];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(startPoint.x, 0)];
    positionAnimation.duration = 0.5;
    
    // 创建透明度动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1.0;
    opacityAnimation.toValue = @0.0;
    opacityAnimation.duration = 0.5;
    
    // 创建动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[positionAnimation, opacityAnimation];
    animationGroup.duration = 0.5;
    animationGroup.delegate = self;
    
    // 添加动画到视图的图层
    [view.layer addAnimation:animationGroup forKey:@"moveAndFadeAnimation"];
    
    // 更新视图的最终位置和透明度
    view.layer.position = CGPointMake(startPoint.x, 0);
    view.layer.opacity = 0.0;
    
    // 动画结束，移除视图
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        UIView *animatedView = [anim valueForKey:@"moveAndFadeAnimation"];
        if (animatedView) {
            [animatedView removeFromSuperview];
        }
    }
}

// 假设夹角是 θ
// angleXY = cosθ + sinθ; => x方向夹角

- (void)apply3DRotationToView:(UIView *)view
                    withAngle:(CGFloat)angle
                            x:(CGFloat)x
                            y:(CGFloat)y
                            z:(CGFloat)z {
    // 创建旋转变换
    CATransform3D rotationTransform = CATransform3DIdentity;
    rotationTransform = CATransform3DRotate(rotationTransform, angle, x, y, z);
    
    // 应用变换到视图的图层
    view.layer.transform = rotationTransform;
}

@end
