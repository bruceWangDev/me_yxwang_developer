//
//  ViewController.m
//  PickerView-国旗选择
//
//  Created by brucewang on 2019/9/3.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "FlagModel.h"
#import "FlagView.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray * dataSourceArray;

@end

@implementation ViewController

#pragma mark - lozy loding
- (NSArray *)dataSourceArray {
    
    if (_dataSourceArray == nil) {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
        NSArray * array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * resultArray = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            
            FlagModel * flagM = [FlagModel flagWithDict:dic];
            [resultArray addObject:flagM];
        }
        
        _dataSourceArray = resultArray;
    }
    return _dataSourceArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.dataSourceArray.count;
}

#pragma mark - UIPickerViewDelegate
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//
//    FlagModel * flagM = self.dataSourceArray[row];
//    return flagM.name;
//}

// 每当有一行内容出现在视野上，就会调用(调用频率很高)
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    FlagView * flagV = [FlagView flagViewWithView:view];
    flagV.flagM = self.dataSourceArray[row];
    
    NSLog(@"flagV - %p, view - %p",flagV, view);
    // 这个 view 为啥不复用了？
    
    return flagV;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return [FlagView flagViewHeight];
}

@end
