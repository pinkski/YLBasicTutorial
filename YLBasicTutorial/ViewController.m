//
//  ViewController.m
//  YLBasicTutorial
//
//  Created by xuanlin.zhu on 16/1/29.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *s_string;               /**<strong string*/
@property (nonatomic, strong) NSMutableString *s_m_string;       /**<strong mutable string*/
@property (nonatomic, copy) NSString *c_string;                      /**<copy string*/
@property (nonatomic, copy) NSMutableString *c_m_string;           /**<copy mutable string*/

@property (nonatomic, strong) NSArray *strongArray;                 /**<strong array*/
@property (nonatomic, strong) NSMutableArray *mStrongArray;         /**<strong mutable array*/
@property (nonatomic, copy) NSArray *cArray;                        /**<copy array*/
@property (nonatomic, copy) NSMutableArray *mCopyArray;             /**<copy mutable array*/

@property (nonatomic, strong) NSURLRequest *strongRequest;          /**<strong request*/
@property (nonatomic, strong) NSMutableURLRequest *mStrongRequest;  /**<strong mutalbe request*/
@property (nonatomic, copy) NSURLRequest *cRequest;                 /**<copy request*/
@property (nonatomic, copy) NSMutableURLRequest *mCopyRequest;      /**<copy mutable request*/

@end



@implementation ViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stringTest];
    
//    [self arrayTest];
//    
//    [self urlRequestTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 为啥要用copy，copy的作用

// 从实例看出使用strong修饰的变量在赋值过程中 属于浅拷贝，而copy修饰的属于深拷贝
// 所以：strong修饰的属性 会随着赋值源头的值改变而改变；
//      copy修饰的属性 则不会随着赋值源头改变而改变；

- (void)stringTest {
    //来源是NSString
    NSString *string = @"string";
    NSLog(@"address: %p | class: %@ of string",string,[string class]);
    self.s_string = string;
    self.c_string = string;
    self.s_m_string = string;
    self.c_m_string = string;
    [self printStringInfo];
    
    NSLog(@"\n");
    
    //来源是NSMutableString
    NSMutableString *mutableString = [NSMutableString stringWithString:@"mutable string"];
    NSLog(@"address: %p | class: %@ of mutable string",mutableString,[mutableString class]);
    self.s_string = mutableString;
    self.c_string = mutableString;
    self.s_m_string = mutableString;
    self.c_m_string = mutableString;
    [self printStringInfo];
}

- (void)printStringInfo {
    NSLog(@"address: %p | class: %@ of strong string",self.s_string,[self.s_string class]);
    NSLog(@"address: %p | class: %@ of copy string",self.c_string,[self.c_string class]);
    NSLog(@"address: %p | class: %@ of strong mutable string",self.s_m_string,[self.s_m_string class]);
    NSLog(@"address: %p | class: %@ of copy mutable string",self.c_m_string,[self.c_m_string class]);
    NSLog(@"\n\n\n");
}


- (void)arrayTest {
    //来源是NSArray
    NSArray *array = @[ @"item1",@"item2"];
    NSLog(@"address: %p | class: %@ of array",array,[array class]);
    self.strongArray = array;
    self.cArray = array;
    self.mStrongArray = array;
    self.mCopyArray = array;
    [self printArrayInfo];
    
    NSLog(@"\n");
    
    //来源是NSMutableArray
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    NSLog(@"address: %p | class: %@ of mutable array",mutableArray,[mutableArray class]);
    self.strongArray = mutableArray;
    self.cArray = mutableArray;
    self.mStrongArray = mutableArray;
    self.mCopyArray = mutableArray;
    [self printArrayInfo];
}

- (void)printArrayInfo {
    NSLog(@"address: %p | class: %@ of strong array",self.strongArray,[self.strongArray class]);
    NSLog(@"address: %p | class: %@ of copy array",self.cArray,[self.cArray class]);
    NSLog(@"address: %p | class: %@ of strong mutable array",self.mStrongArray,[self.mStrongArray class]);
    NSLog(@"address: %p | class: %@ of copy mutable array",self.mCopyArray,[self.mCopyArray class]);
    NSLog(@"\n\n\n");
}


- (void)urlRequestTest {
    //来源是NSURLRequest
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSLog(@"address: %p | class: %@ of url request",urlRequest,[urlRequest class]);
    self.strongRequest = urlRequest;
    self.cRequest = urlRequest;
    self.mStrongRequest = urlRequest;
    self.mCopyRequest = urlRequest;
    [self printRequestInfo];
    
    NSLog(@"\n");
    
    //来源是NSMutableURLRequest
    NSMutableURLRequest *mutableURLRequest = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"address: %p | class: %@ of mutable request",mutableURLRequest,[mutableURLRequest class]);
    self.strongRequest = mutableURLRequest;
    self.cRequest = mutableURLRequest;
    self.mStrongRequest = mutableURLRequest;
    self.mCopyRequest = mutableURLRequest;
    [self printRequestInfo];
}

- (void)printRequestInfo {
    NSLog(@"address: %p | class: %@ of strong request",self.strongRequest,[self.strongRequest class]);
    NSLog(@"address: %p | class: %@ of copy request",self.cRequest,[self.cRequest class]);
    NSLog(@"address: %p | class: %@ of strong mutable equest",self.mStrongRequest,[self.mStrongRequest class]);
    NSLog(@"address: %p | class: %@ of copy mutable request",self.mCopyRequest,[self.mCopyRequest class]);
    NSLog(@"\n\n\n");
}


@end
