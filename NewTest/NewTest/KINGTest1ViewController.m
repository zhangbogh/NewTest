//
//  KINGTest1ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest1ViewController.h"
#import "KINGEditDateView.h"
@interface KINGTest1ViewController ()<KINGEditDateViewDelegate,UITextViewDelegate>
@property (nonatomic ,weak) UIButton *button;
@property (nonatomic ,weak) UILabel *label;
@property (nonatomic ,weak) UITextField *textField;
@property (nonatomic ,weak) UITextView *textView;
@end

@implementation KINGTest1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupProperty];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupProperty {
    XXLazySetLabel(label, [UIColor redColor], 13, @"编辑前", 0)
    XXLazySetTitleButton(button, self, 0, buttonClick:, 14, [UIColor redColor], @"点击按钮")
    //    self.button.backgroundColor = [UIColor greenColor];
    self.button.titleLabel.textColor = [UIColor darkGrayColor];
    [self.button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    self.textField.backgroundColor = [UIColor clearColor];
    self.textField.textColor = [UIColor clearColor];
    self.textField.font = [UIFont systemFontOfSize:13];
//    UIKeyboardTypeDefault,                //                  Default type for the current input method.
//    UIKeyboardTypeASCIICapable,           //                  全英文 不好玩 active
//    UIKeyboardTypeNumbersAndPunctuation,  // 数字全键盘的 可切换拼音
//    UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
//    UIKeyboardTypeNumberPad,              // 数字没有小数点
//    UIKeyboardTypePhonePad,               // 主要是数字 多了个*#等按钮
//    UIKeyboardTypeNamePhonePad,           //              数字和拼音 左下角是切换按钮
//    UIKeyboardTypeEmailAddress,           //              小面有个.com
//    UIKeyboardTypeDecimalPad              // 小数点      有小数点的数字按键
//    UIKeyboardTypeTwitter                 //              跟普通键盘差别不大 多了@和#快捷 (easy access to @ #)
//    UIKeyboardTypeWebSearch NS_E
    self.textField.keyboardType = UIKeyboardTypeWebSearch;
    [self.textField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.textView.backgroundColor = [UIColor greenColor];
    self.textView.keyboardType = UIKeyboardTypeDefault;
    self.textView.delegate = self;
  
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView { //点击进去的时候就调用了
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;    //离开编辑框时调用

}

- (void)textViewDidBeginEditing:(UITextView *)textView {  //点击进去的时候就调用了
    
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    //离开编辑框时调用
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;//编辑时候1先进这个

}
- (void)textViewDidChange:(UITextView *)textView {
    //编辑时候3后进这个
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    //编辑时候2后进这个
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    return YES;//未见调用 赞不追究

}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    return YES;//未见调用 赞不追究

}


- (void)valueChanged:(UITextField *)sender {
    self.label.text = sender.text;
}
- (void)setupUI {
    self.button.frame = CGRectMake(20, 200, 100, 100);
    self.label.frame = CGRectMake(20, 300, 100, 100);
    self.textField.frame = CGRectMake(20, 300, 100, 100);
    self.textView.frame = CGRectMake(200, 300, 100, 100);
}
- (void)buttonClick:(UIButton *)button {
    [KINGEditDateView gotoEditDateViewWithCurrentView:button Delegate:self];
}
- (void)editDateView:(KINGEditDateView *)editDateView currentView:(UIView *)currentView messageOfEdited:(NSString *)message {
    self.label.text = message;
}
XXLazyButton(self.view, button)
XXLazyLabel(self.view, label)
XXLazyTextField(self.view, textField)
XXLazyTextView(self.view, textView)

@end
