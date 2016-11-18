//
//  YLTutorialFirstObject.m
//  YLBasicTutorial
//
//  Created by 张晓岚 on 16/11/17.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import "YLTutorialFirstObject.h"
#import "YLTuorialFirstViewController.h"

@implementation YLTutorialFirstObject

#pragma mark - NSObject 的方法有哪些

// Initializes the class before it receives its first message.
// 懒加载，当runtime向这个类发送消息时才会调用，而且只调用一次，比如alloc] init]
+ (void)initialize {
    
    // 可能会出现initialize重复调用的情况：如果当前的类没有实现initialize,则会转而调用super class的initialize,
    if (self == [YLTutorialFirstObject class]) {
        
        // do the initialzation...
    }
}

//Invoked whenever a class or category is added to the Objective-C runtime; implement this method to perform class-specific behavior upon loading.
// 当一个类或者category被装载到runtime时，会向该类发送调用load消息
+ (void)load {
    
}

+ (instancetype)alloc {
    return  [super alloc];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [super allocWithZone:zone];
}

- (instancetype)init {
    return [super init];
}

- (instancetype)copy {
    return [super copy];
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return [super copyWithZone:zone];
}

- (instancetype)mutableCopy {
    return [super mutableCopy];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return [super mutableCopyWithZone:zone];
}

- (void)dealloc {
}

+ (instancetype)new {
    return [super new];
}

+ (Class)class {
    return [super class];
}

- (Class)superclass {
    return [super superclass];
}

+ (BOOL)isSubclassOfClass:(Class)aClass {
    return [super isSubclassOfClass:aClass];
}


#pragma mark - 非property属性什么时候被编译，什么时候加入autorelease

- (void)buildTime {
    
    YLTuorialFirstViewController *vc = [[YLTuorialFirstViewController alloc] init];
    
    //在autoreleasepool里的会自动添加autorelease
    
}

#pragma mark - 实例对象和对象的区别 

- (void)aboutObject {
    
    // 类 是包括数据和一组关于数据操作的封装体
    // 对象是类的实例，具有生命周期
}

#pragma mark - 除了协议怎么实现多继承？
// 1, 组合方式：通过把父类作为子类的属性
// 2, 关联方式：通过runtime objc_setAssociatedObject

#pragma mark - UITableViewCell的复用
// UITableView其实有两个数组：visibleCells, reusableTableCells
// 一个保存当前展示的cell,一个存储不可见的cell

#pragma mark - OC数据类型
// 1, 基本数据类型： int float double BOOL
// 2, NSInteger CGFloat NS_ENum

- (void)dataType {
    
//    int;float;double;BOOL;char;
//    NSNumber;NSInteger;CGFloat;NS_ENUM();
//    NSString;NSArray;NSDictionary;NSSet;
}

#pragma mark - 单例可以继承吗？ 可以

+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    static NSMutableDictionary *sharedInstances;
    
    dispatch_once(&onceToken, ^{
        sharedInstances = [NSMutableDictionary new];
    });
    
    id sharedInstance;
    @synchronized (self) {
        
        sharedInstance = sharedInstances[NSStringFromClass(self)];
        if (!sharedInstance) {
            sharedInstance = [self new];
            sharedInstances[NSStringFromClass(self)] = sharedInstance;
        }
    }
    
    return sharedInstance;
}






@end
