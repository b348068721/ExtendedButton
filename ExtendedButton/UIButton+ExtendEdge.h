//
//  UIButton+ExtendEdge.h
//  ExtendedButton
//
//  Created by winter on 2017/6/21.
//  Copyright © 2017年 winter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ExtendEdge)
- (void)setExtendEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

//若原热区小于44x44，则放大热区，否则保持原大小不变
- (void)needExtendEdge;
@end
