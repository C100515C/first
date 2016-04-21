//
//  NavTest.m
//  CCTest
//
//  Created by MS on 16-2-13.
//  Copyright (c) 2016年 MS. All rights reserved.
//

#import "NavTest.h"

static NSString const* TabContentOffset = @"Tab_ContentOffset_change";


@interface NavTest ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *NavView;
@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end

@implementation NavTest

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.myTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:(__bridge void *)(TabContentOffset)];
//    [self.myTable setContentOffset:CGPointMake(0, -128) animated:NO];
    [self.myTable setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{

    if ([keyPath isEqualToString: @"contentOffset"]) {
        
//      NSString *obg = [change valueForKey:NSKeyValueChangeNewKey];
        UITableView *tab = (UITableView*)object;
//        NSLog(@"change = %@-%@-%f",[change valueForKey:NSKeyValueChangeNewKey],obg,tab.contentOffset.y
//              );
        CGFloat cha = tab.contentOffset.y-64;
        CGFloat offset = tab.contentOffset.y;
        NSLog(@"c=%f",offset);
        if (offset<-128) {
            [tab setContentInset:UIEdgeInsetsMake(104, 0, 0, 0)];
        }
        
        if (cha>0) {
            CGFloat alp = (100-cha)/100.0f;
            
            [UIView animateWithDuration:0.1 animations:^{
                self.NavView.alpha = alp;
            }];
            
        }
//        CGRect rect = tab.frame;
//        
//            rect.origin.y = 64 - offset;
//            rect.size.height = self.view.frame.size.height+offset;
//            if (rect.origin.y) {
//                tab.frame = rect;
//            }
//        
//        
//        NSLog(@"cc=%f",rect.origin.y);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.backgroundColor = [UIColor blackColor];
    }
    return cell;
}
@end
