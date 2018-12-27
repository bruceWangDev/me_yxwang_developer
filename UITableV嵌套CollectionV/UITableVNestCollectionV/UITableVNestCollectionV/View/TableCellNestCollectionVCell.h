//
//  TableCellNestCollectionVCell.h
//  UITableVNestCollectionV
//
//  Created by brucewang on 2018/12/27.
//  Copyright © 2018 brucewang. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 在 Swift 中存在 Option 类型，也就是使用 ？ 和 ！声明的变量。
 但是 OC 里面没有这个特征，因为在 Xcode 6.3 之后出现的新的关键字可以定义 OC 转 Swift 的时候可以区分什么类型
 
 __nullable 和 __nonnull
 __nullable 指代对象可以为 NULL 或者 NIL
 __nonnull 指代对象不能为 null
 当我们不遵循这一规则时，编译器会给出警告
 
 但是如果每个属性都指定 __nullable 和 __nonnull 是一件非常繁琐的事情。
 苹果为了减轻我们的工作量，专门提供了两个宏: NS_ASSUME_NONNULL_BEGIN 和 NS_ASSUME_NONNULL_END (更是 Xcode 10 的新特性，创建文件自带)
 在这两个宏之间的代码，所有的简单指针对象都被假定为 __nonnull，因此我们只需要去指定那些 __nullable 的指针
 
 不过为了安全起见，id 类型必须显示的去指定 __nullable 和 __nonnull
 */
NS_ASSUME_NONNULL_BEGIN

@interface TableCellNestCollectionVCell : UITableViewCell

@end

NS_ASSUME_NONNULL_END
