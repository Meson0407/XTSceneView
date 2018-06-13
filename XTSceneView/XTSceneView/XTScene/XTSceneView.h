//
//  XTSceneView.h
//  XTSceneView
//
//  Created by 薛涛 on 2018/6/13.
//  Copyright © 2018年 XT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

@interface XTSceneView : UIView

@property (nonatomic, strong) SCNNode *node;

@property (nonatomic, assign) BOOL select;

@end
