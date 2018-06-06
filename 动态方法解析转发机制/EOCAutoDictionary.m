//
//  EOCAutoDictionary.m
//  动态方法解析转发机制
//
//  Created by xujing on 16/11/4.
//  Copyright © 2016年 xujing. All rights reserved.
//
#import <objc/runtime.h>
#import "EOCAutoDictionary.h"

@interface EOCAutoDictionary()

@property (nonatomic,strong)NSMutableDictionary *backingStore;

@end


@implementation EOCAutoDictionary

@dynamic string,date,number,opaqueObject;  //@dynamic 意思是由开发人员提供相应的代码：对于只读属性需要提供 getter，对于读写属性需要提供 getter 和setter。


- (instancetype)init
{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary dictionary];
    }
    return self;
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
   
    NSString *selectorString = NSStringFromSelector(sel);
    if (([selectorString hasPrefix:@"set"])) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
        
    }else{
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }

    return YES;
}

void autoDictionarySetter(id self,SEL _cmd,id value){
    
    EOCAutoDictionary *typedSelf = (EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    //remove the ' :' at the end
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    //remove the 'set ' prefix
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    //lowercase the first character
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    }else{
        [backingStore removeObjectForKey:key];
    }
}

id autoDictionaryGetter(id self,SEL _cmd){
   
    EOCAutoDictionary *typedSelf = (EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    NSString *key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
    
}




@end
