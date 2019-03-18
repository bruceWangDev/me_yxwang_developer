//
//  ViewController.m
//  FMDBPractice
//
//  Created by brucewang on 2019/1/29.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
//    [self getSandBoxURL];
 
//    [self useNSUserDefaults];
    
//    [self saveString];
//    [self readingString];
    
//    [self saveArray];
//    [self readingArray];
    
//    [self saveDirectory];
//    [self readingDirectory];
    
//    [self saveData];
//    [self readingData];
    
//    [self saveImage];
//    [self readingImage];
    
    [self archive];
    
}

#pragma mark - 归档和反归档
- (void)archive {
    
    NSArray * array = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * filePath = [documentsString stringByAppendingPathComponent:@"textPlist.plist"];
    NSLog(@"filePath is %@",filePath);
 
    BOOL success = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    NSLog(@"success is %d",success);
    
}

/*
 NSSearchPathForDirectoriesInDomains 详解
 此方法用于 检索指定路径
 第一个参数指定了搜索路径的名称，NSDocumentDirectory 表示是在 documents 中寻找，NSCacheDirectory 就是在 cache 中寻找
 第二个参数限定了文件的检索范围只是在沙箱内部。其意义为用户电脑的主目录，也可以修改为网络主机等。
 最后一个参数决定了是否展开波浪线符号，展开后才是完整路径，这个布尔值一直为 YES
 
 该方法返回值是一个数组，在 iphone 中由于只有一个唯一路径(相对于 OC 而言)，所以直接取数组的第一个元素即可。
 */

#pragma mark - image 的存储和读取
- (void)saveImage {
    
    // 获取 documents 目录
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 在文件路径下创建该文件夹
    NSString * imagePath = [documentsString stringByAppendingString:@"/image.png"];
    
    // 将.png 转换为 data 格式
    NSData * imageData = UIImagePNGRepresentation([UIImage imageNamed:@"点个赞吧.png"]);
//    NSData * imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"点个赞吧.png"], 1);
    
    // 将 data 写入文件夹
    [imageData writeToFile:imagePath atomically:YES];
    
}

- (void) readingImage {
    
    // 获取路径
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * imagePath = [documentsString stringByAppendingString:@"/image.png"];

    // 获取文件
    NSData * imageData = [NSData dataWithContentsOfFile:imagePath];
    
    // 获取图片
    UIImage * image = [UIImage imageWithData:imageData];
    
    // 加载图片
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 120, 120)];
    imageV.image = image;
    [self.view addSubview:imageV];
    
}


#pragma mark - data 的存储和读取
- (void)saveData {
    
    // 获取 documents 目录
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 存储路径
    NSString * dataPlistPath = [documentsString stringByAppendingString:@"/data.plist"];
    
    // 存储内容
    NSString * string = @"ddaattaa";
    
    // 将 string 转换为 data
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    // 写入文件夹
    [data writeToFile:dataPlistPath atomically:YES];
    
}

- (void)readingData {
    
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * dataPlistPath = [documentsString stringByAppendingString:@"/data.plist"];

    // 从文件读取 data
    NSData * data = [NSData dataWithContentsOfFile:dataPlistPath];
    
    // 将 data 转换成 string
    NSString * string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data string is %@",string);
    
}


#pragma mark - 字典的存储和读取
- (void)saveDirectory {
    
    // 获取 documents 目录
    NSString * documentsStrig = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 在沙盒下创建文件
    NSString * plistPath = [documentsStrig stringByAppendingString:@"/directory.plist"];
    
    // 存储内容
    NSDictionary * directory = @{@"n1":@[@"1",@"2",@"3"], @"n2":@[@"a",@"b",@"c",@"d"], @"n3":@"hello world"};
    
    // 写入文件
    [directory writeToFile:plistPath atomically:YES];
    
}

- (void)readingDirectory {
    
    NSString * documentsStrig = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * plistPath = [documentsStrig stringByAppendingString:@"/directory.plist"];

    // 读取数据
    NSDictionary * directory = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSLog(@"directory is %@",directory);
    
}


#pragma mark - 数组的存储和读取
- (void)saveArray {
    
    // 获取 documents 目录
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 在沙盒下创建文件
    NSString * plistPath = [documentsString stringByAppendingString:@"/array.plist"];
    
    // 要保存的内容
    NSArray * array = @[@"张三", @"李四"];
    
    // 写入文件
    [array writeToFile:plistPath atomically:YES];
    
}

- (void)readingArray {
    
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * plistPath = [documentsString stringByAppendingString:@"/array.plist"];

    // 读取数据
    NSArray * array = [NSArray arrayWithContentsOfFile:plistPath];
    NSLog(@"array is %@",array);
    
}


#pragma mark - 基本字符串类型的存取
- (void)saveString {
    
    // 获取 documents 目录
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 在沙盒下创建文件
    NSString * textPath = [documentsString stringByAppendingString:@"/text.txt"];
    
    // 要保存的内容
    NSString * content = @"字符串123";
    
    // 写入文件
    [content writeToFile:textPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
}

- (void)readingString {
    
    NSString * documentsString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * textPath = [documentsString stringByAppendingString:@"/text.txt"];
    
    // 读取数据
    NSString * content = [NSString stringWithContentsOfFile:textPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"content is %@",content);
    
}


#pragma mark - NSUserDefaults
- (void)useNSUserDefaults {
    
    // 用 NSUserDefaults 去 Preferences 进行读取和设置
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setObject:@"zhangsan" forKey:@"name1"];
    [user setObject:@"lisi"     forKey:@"name2"];
    
    // 将数据同步到沙盒的规定目录下 （Library 下 的 Preferences 目录）
    [user synchronize];
    
    NSLog(@"name1 is %@", [user objectForKey:@"name1"]);
    
}


#pragma mark - 获取沙盒路径
- (void)getSandBoxURL {
    
    // 获取沙盒路径的两种方法
    
    // 方法 - 1 （自己拼接）
    NSString * path = NSHomeDirectory();
    NSString * documentsString_custom = [path stringByAppendingString:@"/Documents"]; // 需要/
    NSString * documentsString_system = [path stringByAppendingPathComponent:@"Documents"]; // 不需要/
    NSLog(@"HomeDirectory_path is %@ \n documentsString_custom is %@ \n documentsString_system is %@", path, documentsString_custom, documentsString_system);
    
    /*
     打印结果
     HomeDirectory_path is /Users/brucewang/Library/Developer/CoreSimulator/Devices/D67F0FD2-33CE-498A-8743-00AFB48A0ED4/data/Containers/Data/Application/2A34FDBA-0EB6-4AAD-ADA9-9E8720EAE198
     documentsString_custom is /Users/brucewang/Library/Developer/CoreSimulator/Devices/D67F0FD2-33CE-498A-8743-00AFB48A0ED4/data/Containers/Data/Application/2A34FDBA-0EB6-4AAD-ADA9-9E8720EAE198/Documents
     documentsString_system is /Users/brucewang/Library/Developer/CoreSimulator/Devices/D67F0FD2-33CE-498A-8743-00AFB48A0ED4/data/Containers/Data/Application/2A34FDBA-0EB6-4AAD-ADA9-9E8720EAE198/Documents
     */
    
    // 方法 - 2 （系统提供的方法获取 Documents 路径）
    NSArray * array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentString_searchForDic = [array lastObject];
    NSLog(@"documentString_searchForDic is %@",documentString_searchForDic);
    
    // 获取 Library 路径
    NSArray * array_library = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * libraryString_searchForDic = [array_library lastObject];
    NSLog(@"libraryString_searchForDic is %@",libraryString_searchForDic);
    
    // 获取 tmp 路径
    NSString * tmpString = NSTemporaryDirectory();
    NSLog(@"tmpString is %@",tmpString);
    
    // 获取 caches 路径
    NSArray * array_caches = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachesString_searchForDic = [array_caches lastObject];
    NSLog(@"cachesString_searchForDic is %@",cachesString_searchForDic);
    
}


@end
