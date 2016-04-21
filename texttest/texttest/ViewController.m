//
//  ViewController.m
//  texttest
//
//  Created by chenchen on 16/4/18.
//  Copyright © 2016年 chenchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *test;
@property (weak, nonatomic) IBOutlet UIButton *bt;
- (IBAction)btnn:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnn:(UIButton *)sender {
    
   
//    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//    self.test.attributedText = attributedString;
    
    NSLog(@"%@-%@",self.test.text,[self stringChangeHtmlWith:self.test.text]);
}

-(NSString*)stringChangeHtmlWith:(NSString*)str{
    NSString *a = @"\n";
    NSString *b = @"'\'";
    NSString *c = @" ";
    NSArray *arr = @[a,b,c];
    NSArray *htm = @[@"<br>",@"&nbsp;&nbsp;",@"&nbsp;"];
    
    NSString *ret = str;
    for (int i=0;i<arr.count;i++) {
       NSArray *tmpArr = [ret componentsSeparatedByString:arr[i]];
        if (tmpArr.count<=1) {
            continue;
        }else{
          ret = [tmpArr componentsJoinedByString:htm[i]];
        }
    }
   
    return [NSString stringWithFormat:@"<p>%@</p>",ret];
}

@end
