//
//  Constant.h
//  TRProject
//
//  Created by jiyingxin on 16/2/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#ifndef Constant_h
#define Constant_h





//屏幕宽度
#define kScreenW [UIScreen mainScreen].bounds.size.width

//屏幕高度
#define kScreenH [UIScreen mainScreen].bounds.size.height

//三原色的设置
#define kRGBColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//Documents文件夹的路径
#define kDocPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
//appdelegate的实例对象
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//把self转化为 __weak __block的方式, 方便的在block中使用而不导致内存循环应用问题
//在宏中使用 \ 可以换行
#define WK(weakSelf) \
__weak __typeof(&*self)weakSelf = self;\

//宏中的斜杠作用是换行
#define kDescription \
- (NSString *)description{\
unsigned int outCount = 0;\
NSMutableString *str = [NSMutableString new];\
Ivar *varList = class_copyIvarList(self.class, &outCount);\
for (int i = 0; i < outCount; i++) {\
Ivar var = varList[i];\
const char *name = ivar_getName(var);\
NSString *propertyName = [NSString \stringWithUTF8String:name];\
id value = [self valueForKey:propertyName];\
[str appendFormat:@"%@:%@",propertyName,value];\
}\
free(varList);\
return str;\
}
//cellIdentify
#define kRecommendCell @"RecommendCell"
#define kLiveCell @"LiveCell"
#define kColumnCell @"ColumnCell"
#define kColumnHeaderCell @"ColumnHeaderCell"
#define kColumnHeaderCell1 @"ColumnHeaderCell1"
#endif /* Constant_h */
