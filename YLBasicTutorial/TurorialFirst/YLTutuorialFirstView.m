//
//  YLTutuorialFirstView.m
//  YLBasicTutorial
//
//  Created by 张晓岚 on 16/11/17.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import "YLTutuorialFirstView.h"

@implementation YLTutuorialFirstView

/// 不规则图形响应事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    const CGFloat halfWidth = 100;
    CGFloat xOffset = point.x - 100;
    CGFloat yOffset = point.y - 100;
    CGFloat radius = sqrt(xOffset * xOffset + yOffset * yOffset);
    return radius <= halfWidth;
}



@end
