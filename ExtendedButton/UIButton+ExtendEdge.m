//
//  UIButton+ExtendEdge.m
//  ExtendedButton
//
//  Created by winter on 2017/6/21.
//  Copyright © 2017年 winter. All rights reserved.
//

#import "UIButton+ExtendEdge.h"
#import <objc/runtime.h>

@implementation UIButton (ExtendEdge)
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)needExtendEdge {
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    if (widthDelta > 0 && heightDelta == 0) {
        [self setExtendEdgeWithTop:0 right:0.5 * widthDelta bottom:0 left:0.5 * widthDelta];
    }
    else if (widthDelta == 0 && heightDelta > 0) {
        [self setExtendEdgeWithTop:0.5 * heightDelta right:0 bottom:0.5 * heightDelta left:0];
    }
    else if (widthDelta == 0 && heightDelta == 0) {
        [self setExtendEdgeWithTop:0 right:0 bottom:0 left:0];
    }
    else {
        [self setExtendEdgeWithTop:0.5 * heightDelta right:0.5 * widthDelta bottom:0.5 * heightDelta left:0.5 * widthDelta];
    }
}

- (void)setExtendEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
