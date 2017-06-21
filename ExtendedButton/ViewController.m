//
//  ViewController.m
//  ExtendedButton
//
//  Created by winter on 2017/6/21.
//  Copyright © 2017年 winter. All rights reserved.
//

#import "ViewController.h"
#import "XDButton.h"
#import "UIButton+ExtendEdge.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *SBButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XDButton *btn = [[XDButton alloc]initWithFrame:CGRectMake(50, 200, 10, 10)];
    [btn setTitle:@"XDButton" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(xdClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self.SBButton setExtendEdgeWithTop:30 right:30 bottom:30 left:30];
}

- (void)xdClick {
    NSLog(@"xdClick");
}
- (IBAction)SBClick:(id)sender {
    NSLog(@"SBClick");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
