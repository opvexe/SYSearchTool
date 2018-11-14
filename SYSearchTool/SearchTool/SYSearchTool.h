//
//  SYSearchTool.h
//  SYSearchTool
//
//  Created by FaceBook on 2018/11/14.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYSearchTool : NSObject

/**
 *  创建实例对象
 *
 *  @return 搜索对象
 */
+ (SYSearchTool *)tool;


/**
 * 谓词搜索

 @param fieldArray 谓词搜索关键字 注：pinyin
 @param inputString 输入搜索文字
 @param array 搜索谓词的数据库
 @return 谓词搜索结果
 */
- (NSArray *)searchWithFieldArray:(NSArray *)fieldArray
                      inputString:(NSString *)inputString
                          inArray:(NSArray *)array;


/**
 * 分组搜索

 @param allFieldArray 字段数组集合
 @param inputString 输入文字
 @param allArray 搜索数组集合
 @return 搜索结果
 */
- (NSArray *)searchWithAllFieldArray:(NSArray *)allFieldArray
                         inputString:(NSString *)inputString
                          inAllArray:(NSArray *)allArray;
@end

NS_ASSUME_NONNULL_END
