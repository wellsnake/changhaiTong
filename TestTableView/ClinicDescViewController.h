//
//  ClinicDescViewController.h
//  TestTableView
//
//  Created by wellsnake on 13-6-25.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialClinicIndex.h"
@interface ClinicDescViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) SpecialClinicIndex *clinicDesc;
@property (weak, nonatomic) IBOutlet UITextView *clinicLabel;
@property (weak, nonatomic) IBOutlet UITableView *timedesctableview;

@end
