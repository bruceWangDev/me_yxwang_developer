//
//  ViewController.m
//  PickerView-点餐系统-01
//
//  Created by brucewang on 2019/4/12.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray * foods;
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)foods {
    
    if (_foods == nil) {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods" ofType:@"plist"]];
    }
    return _foods;
}

- (void)viewDidLoad {
 
    [super viewDidLoad];
    
    // 初始化
    self.fruitLabel.text = self.foods[0][0];
    self.mainLabel.text  = self.foods[1][0];
    self.drinkLabel.text = self.foods[2][0];
    
}

#pragma mark - picker dataSource
// 一共多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return self.foods.count;
}

// 每列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    NSArray * subFoods = self.foods[component];
    return subFoods.count;
}

#pragma mark - picker delegate
// 每列每行显示的文字
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.foods[component][row];
}

// 选中第 component 列的 第 row 行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"component is %ld row is %ld",component,row);
    
    if (component == 0) { // 水果
        self.fruitLabel.text = self.foods[0][row];
    } else if (component == 1) { // 主菜
        self.mainLabel.text  = self.foods[1][row];
    } else if (component == 2) { // 饮料
        self.drinkLabel.text = self.foods[2][row];
    }
    // 原来可以省略最后一个 else
    
}

@end
