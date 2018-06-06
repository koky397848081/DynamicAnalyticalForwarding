//
//  EOCAutoDictionary.h
//  动态方法解析转发机制
//
//  Created by xujing on 16/11/4.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCAutoDictionary : NSObject

@property (nonatomic,strong)NSString *string;
@property (nonatomic,strong)NSNumber *number;
@property (nonatomic,strong)NSDate *date;
@property (nonatomic,strong)id opaqueObject;

@end
