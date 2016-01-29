//
//  ViewController.m
//  YLBasicTutorial
//
//  Created by xuanlin.zhu on 16/1/29.
//  Copyright © 2016年 xuanlin.zhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *strongString;               /**<strong string*/
@property (nonatomic, strong) NSMutableString *mStrongString;       /**<strong mutable string*/
@property (nonatomic, copy) NSString *cString;                      /**<copy string*/
@property (nonatomic, copy) NSMutableString *mCopyString;           /**<copy mutable string*/

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
    
    [self arrayTest];
    
    [self urlRequestTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data

- (void)stringTest {
    //来源是NSString
    NSString *string = @"string";
    NSLog(@"address: %p | class: %@ of string",string,[string class]);
    self.strongString = string;
    self.cString = string;
    self.mStrongString = string;
    self.mCopyString = string;
    [self printStringInfo];
    
    NSLog(@"\n");
    
    //来源是NSMutableString
    NSMutableString *mutableString = [NSMutableString stringWithString:@"mutable string"];
    NSLog(@"address: %p | class: %@ of mutable string",mutableString,[mutableString class]);
    self.strongString = mutableString;
    self.cString = mutableString;
    self.mStrongString = mutableString;
    self.mCopyString = mutableString;
    [self printStringInfo];
}

- (void)printStringInfo {
    NSLog(@"address: %p | class: %@ of strong string",self.strongString,[self.strongString class]);
    NSLog(@"address: %p | class: %@ of copy string",self.cString,[self.cString class]);
    NSLog(@"address: %p | class: %@ of strong mutable string",self.mStrongString,[self.mStrongString class]);
    NSLog(@"address: %p | class: %@ of copy mutable string",self.mCopyString,[self.mCopyString class]);
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
