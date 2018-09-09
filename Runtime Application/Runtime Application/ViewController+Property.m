//
//  ViewController+Property.m
//  Runtime Application
//
//  Created by fukang on 2018/9/9.
//  Copyright © 2018年 fukang. All rights reserved.
//

#import "ViewController+Property.h"
#import "objc/runtime.h"

static char kNewTitleKey;
static char kNewArrKey;

@implementation ViewController (Property)

- (void)setNewTitle:(NSString *)newTitle {

    objc_setAssociatedObject(self, &kNewTitleKey, newTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSString*)newTitle {

    return objc_getAssociatedObject(self, &kNewTitleKey);
}

- (void)setNewArr:(NSArray *)newArr {
    
    objc_setAssociatedObject(self, &kNewArrKey, newArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSArray*)newArr {
    
    return objc_getAssociatedObject(self, &kNewArrKey);;
}




@end
