//
//  NSObject+RuntimeModel.m
//  Runtime Application
//
//  Created by fukang on 2018/9/9.
//  Copyright © 2018年 fukang. All rights reserved.
//

#import "NSObject+RuntimeModel.h"
#import "objc/runtime.h"

@implementation NSObject (RuntimeModel)


- (void)initWithDict:(NSDictionary *)dict {
    
    //(1)获取类的属性及属性对应的类型
    NSMutableArray * keys = [NSMutableArray array];
    NSMutableArray * attributes = [NSMutableArray array];
    /*
     * 例子
     * name = value3 attribute = T@"NSString",C,N,V_value3
     * name = value4 attribute = T^i,N,V_value4
     */
    unsigned int outCount;
    objc_property_t * properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        objc_property_t property = properties[i];
        //通过property_getName函数获得属性的名字
        NSString * propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
        //通过property_getAttributes函数可以获得属性的名字和@encode编码
        NSString * propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        [attributes addObject:propertyAttribute];
    }
    //立即释放properties指向的内存
    free(properties);
    
    //(2)根据类型给属性赋值
    for (NSString * key in keys) {
        if ([dict valueForKey:key] == nil) continue;
        [self setValue:[dict valueForKey:key] forKey:key];
    }
}


@end
