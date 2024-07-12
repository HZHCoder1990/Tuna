//
//  OWSGameViewController.m
//  Tuna
//
//  Created by mac on 2024/7/12.
//

#import "OWSGameViewController.h"
#import "OWSRotationView.h"

@interface OWSGameViewController ()

@end

@implementation OWSGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OWSRotationView *v = [[OWSRotationView alloc] initWithFrame:CGRectMake(0, (OWSScreenHeight - 300) / 2, OWSScreenWidth, 300)];
    [self.view addSubview:v];
}

@end
