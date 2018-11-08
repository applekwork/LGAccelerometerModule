//
//  LGMotionManager.h
//  LGAccelerometerModule
//
//  Created by LG on 2018/11/8.
//  Copyright © 2018年 LG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

typedef void (^LGAccelerometerHandler)(CMAcceleration acceleration, NSError *error);

/**
 这是一个对`CMMotionManager`进行封装的类，主要实现加速计(摇一摇)
 */

@interface LGMotionManager : NSObject
/**
 单例
 */
+ (instancetype)shareInstance;

/**
 开始更新频率
 */
- (void)startAccelerometerUpdatesWithHandler:(LGAccelerometerHandler)handler;

/**
 停止更新频率
 */
- (void)stopAccelerometerUpdates;
@end
