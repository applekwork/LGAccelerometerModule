

//
//  LGMotionManager.m
//  LGAccelerometerModule
//
//  Created by LG on 2018/11/8.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "LGMotionManager.h"

@interface LGMotionManager ()
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation LGMotionManager
+ (instancetype)shareInstance
{
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

#pragma mark - 开始更新频率
- (void)startAccelerometerUpdatesWithHandler:(LGAccelerometerHandler)handler
{
    if (![self.motionManager isAccelerometerAvailable]) {
        //如果加速计不可用
        NSLog(@"Accelerometer is not Available");
        return;
    }
    [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        //获取加速度
        CMAcceleration acceleration = accelerometerData.acceleration;
        NSLog(@"加速度 == x:%f, y:%f, z:%f", fabs(acceleration.x), fabs(acceleration.y), fabs(acceleration.z));
        
        //值越大说明摇动的幅度越大
        double num = 1.5f;
        if (fabs(acceleration.x) > num || fabs(acceleration.y) > num ||fabs(acceleration.z) > num) {
            //停止更新
            [self stopAccelerometerUpdates];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(acceleration, error);
            });
        }
    }];
}


#pragma mark - 停止更新频率
- (void)stopAccelerometerUpdates
{
    [self.motionManager stopAccelerometerUpdates];
}
- (CMMotionManager *)motionManager
{
    if (_motionManager == nil) {
        _motionManager = [[CMMotionManager alloc] init];
        _motionManager.accelerometerUpdateInterval = 0.1;   //加速计更新频率，以秒为单位
    }
    return _motionManager;
}

@end
