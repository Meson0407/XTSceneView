
//
//  XTSceneView.m
//  XTSceneView
//
//  Created by 薛涛 on 2018/6/13.
//  Copyright © 2018年 XT. All rights reserved.
//

#import "XTSceneView.h"

@implementation XTSceneView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        _select = NO;
        [self createScene];
    }
    
    return self;
    
}

#pragma mark - 创建3D模型场景
- (void)createScene {
    
    // 初始化一个场景
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/walker_step.DAE"];
    
    // 取出场景中根结点的第一个结点 目录根结点也就一个子结点
    _node = scene.rootNode.childNodes.firstObject;
    // 绕 y轴 一直旋转
    SCNAction *action = [SCNAction repeatActionForever:[SCNAction rotateByX:0 y:1 z:0 duration:0.5]];
    [_node runAction:action];
    
    _node.opacity = 0.3;
    
    // 创建灯光
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeAmbient;
    lightNode.light.color = [UIColor whiteColor];
    [scene.rootNode addChildNode:lightNode];
    
    // 创建一个用来展示场景的SCNView
    SCNView *scnView = [[SCNView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    
    [self addSubview:scnView];
    
    // 设置场景
    scnView.scene = scene;
    
    // 设置背景
    scnView.backgroundColor = [UIColor clearColor];
    
    // 允许控制摄像机位置
    scnView.allowsCameraControl = YES;
    
    // 不显示数据控制台
    scnView.showsStatistics = NO;
    
    // 加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCliked)];
    [scnView addGestureRecognizer:tap];

}

#pragma mark - 点击事件
- (void)tapCliked {
    
    if (!_select) {
        
        [_node runAction:[SCNAction fadeInWithDuration:0.3]];
        [_node runAction:[SCNAction scaleTo:1.1 duration:0.3]];
        
    } else {
        
        [_node runAction:[SCNAction fadeOpacityTo:0.3 duration:0.3]];
        [_node runAction:[SCNAction scaleTo:1.0 duration:0.3]];
        
    }
    
    _select = !_select;
    
}

@end











