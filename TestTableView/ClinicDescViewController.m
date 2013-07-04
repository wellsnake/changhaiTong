//
//  ClinicDescViewController.m
//  TestTableView
//
//  Created by wellsnake on 13-6-25.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "ClinicDescViewController.h"
#import "SpecialClinicIndex.h"
@interface ClinicDescViewController ()

@end

@implementation ClinicDescViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置tableView的数据源
    self.timedesctableview.dataSource = self;
    // 设置tableView的委托
    self.timedesctableview.delegate = self;
    //self.timedesctableview = tableView;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setClinicDesc:(SpecialClinicIndex *)newclinicDesc
{
    if(_clinicDesc != newclinicDesc){
        _clinicDesc = newclinicDesc;
        [self configureView];
    }
}

-(void)configureView
{
    if (self.clinicDesc){
        //第一次调出的时候一下代码无效，应为还未给3个标签分配内存空间
        self.clinicLabel.text = self.clinicDesc.clinicName;
        }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"出诊时间";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.clinicDesc.clinicDate.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];  
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.clinicDesc.clinicDate objectAtIndex:indexPath.row];
    return cell;
}
@end
