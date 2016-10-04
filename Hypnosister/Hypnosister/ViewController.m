//
//  ViewController.m
//  Hypnosister
//
//  Created by 穆康 on 16/10/4.
//  Copyright © 2016年 mukang. All rights reserved.
//

#import "ViewController.h"
#import "MKHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MKHypnosisView *hypnosisView = [[MKHypnosisView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:hypnosisView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
