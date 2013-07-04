//
//  MyTableViewController.m
//  TestTableView
//
//  Created by wellsnake on 13-6-23.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "MyTableViewController.h"
#import "ClinicDescViewController.h"
#import "SpecialClinicIndexList.h"
#import "SpecialClinicIndex.h"
@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"专病号";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //取得完整的文件名
    NSString *fileName = [plistPath stringByAppendingPathComponent:@"specialClinic.plist"];
    //先将结果放入字典内
    NSMutableDictionary *mylist =[[NSMutableDictionary alloc]initWithContentsOfFile:fileName];
    //获取所有的科室名称
    NSMutableArray *deptNameList = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in mylist[@"desc"]) {
        if ([deptNameList indexOfObject:dict[@"dept_name"]] == NSNotFound ) {
            [deptNameList addObject:dict[@"dept_name"]];
        }
    }
    //将数据根据科室分组放入字典数组内
    self.specialClinic = [[NSMutableArray alloc] init];
    for (NSString *deptName in deptNameList) {
        NSMutableArray * desc = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in mylist[@"desc"]) {
            if (deptName == dict[@"dept_name"]) {
                [desc addObject:dict];
            }
        }
        [self.specialClinic addObject:[[SpecialClinicIndexList alloc] initWithArray:desc]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.specialClinic count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SpecialClinicIndexList *list = self.specialClinic[section];
    return list.deptName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SpecialClinicIndexList *list = self.specialClinic[section];
    return list.clinicIndexList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"clinic";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    SpecialClinicIndexList *list = self.specialClinic[indexPath.section];
    SpecialClinicIndex *index =  list.clinicIndexList[indexPath.row];
    
    cell.textLabel.text = index.clinicName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] % 2 == 0){
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *msg = [[NSString alloc] initWithFormat:@"你选择的是:%@",self.specialClinic[indexPath.section][@"desc"][indexPath.row][@"clinic_name"]];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alert show];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"displayDesc"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SpecialClinicIndexList *list = self.specialClinic[indexPath.section];
        SpecialClinicIndex *index =  list.clinicIndexList[indexPath.row];
        [segue.destinationViewController setClinicDesc:index];
    }
}

@end
