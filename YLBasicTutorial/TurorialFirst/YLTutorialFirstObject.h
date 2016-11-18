//
//  YLTutorialFirstObject.h
//  YLBasicTutorial
//
//  Created by 张晓岚 on 16/11/17.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLTutorialFirstObject : NSObject

#pragma mark - NSObject 的方法有哪些

+ (BOOL)instancesRespondToSelector:(SEL)aSelector;
+ (BOOL)conformsToProtocol:(Protocol *)protocol;

- (IMP)methodForSelector:(SEL)aSelector;
+ (IMP)instanceMethodForSelector:(SEL)aSelector;

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector;
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;

+ (NSString *)description;

//sending message
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray<NSRunLoopMode> *)modes;

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray<NSString *> *)array;

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray<NSString *> *)array;

- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg;

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument;

//forwarding message
- (void)forwardInvocation:(NSInvocation *)anInvocation;
- (id)forwardingTargetForSelector:(SEL)aSelector;

//resolving method
+ (BOOL)resolveClassMethod:(SEL)sel;
+ (BOOL)resolveInstanceMethod:(SEL)sel;

- (void)doesNotRecognizeSelector:(SEL)aSelector;

//Archiving
+ (Class)classForKeyedUnarchiver;
- (id)replacementObjectForCoder:(NSCoder *)aCoder;
- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver;
+ (void)setVersion:(NSInteger)aVersion;
+ (NSInteger)version;

@end
