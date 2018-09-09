//
//  ViewController.m
//  Runtime Application
//
//  Created by fukang on 2018/9/9.
//  Copyright © 2018年 fukang. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Property.h"
#import "RuntimeModel.h"
#import "NSObject+RuntimeModel.h"
#import "objc/runtime.h"

@interface ViewController ()

@property (nonatomic , strong) RuntimeModel *runtimeM;

@end

@implementation ViewController

//+ (void)load {
//
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        SEL originalSelector = @selector(viewDidLoad);
//        SEL swizzledSelector = @selector(FKViewdidLoad);
//
//        Method originalMethod = class_getInstanceMethod(class,originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class,swizzledSelector);
//
//        method_exchangeImplementations(originalMethod, swizzledMethod);
//    });
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testCategoryProperty];

    NSLog(@"viewDidLoad");
    
}


- (void)FKViewdidLoad {
    
    NSLog(@"FKViewdidLoad");

    self.runtimeM = [[RuntimeModel alloc] init];
    [self.runtimeM initWithDict:@{@"time" : @"5点" , @"name" : @"FK" , @"sex" : @"Man"}];
    NSLog(@"%@ - %@ - %@",self.runtimeM.time , self.runtimeM.name , self.runtimeM.sex);
}


- (void)testCategoryProperty {
    
    self.newTitle = @"FK";
    NSLog(@"%@",self.newTitle);
    NSLog(@"运行成功");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
