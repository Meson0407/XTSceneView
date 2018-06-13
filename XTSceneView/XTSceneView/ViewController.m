//
//  ViewController.m
//  XTSceneView
//
//  Created by 薛涛 on 2018/6/13.
//  Copyright © 2018年 XT. All rights reserved.
//

#import "ViewController.h"
#import "XTSceneView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    XTSceneView *view = [[XTSceneView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
