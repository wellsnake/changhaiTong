//
//  CommDescViewController.h
//  TestTableView
//
//  Created by wellsnake on 13-7-4.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommClinicIndex.h"
@interface CommDescViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) CommClinicIndex *clinicDesc;
@property (weak, nonatomic) IBOutlet UITextView *clinicLabel;
@property (weak, nonatomic) IBOutlet UITableView *timedesctableview;
@end
