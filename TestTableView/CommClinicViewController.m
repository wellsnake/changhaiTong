//
//  CommClinicViewController.m
//  TestTableView
//
//  Created by wellsnake on 13-7-4.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "CommClinicViewController.h"
#import "CommClinicIndex.h"
#import "CommDescViewController.h"
@interface CommClinicViewController ()

@end

@implementation CommClinicViewController

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
    self.title = @"普通号";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //取得完整的文件名
    NSString *fileName = [plistPath stringByAppendingPathComponent:@"commClinic.plist"];
    //先将结果放入字典内
    NSMutableDictionary *mylist =[[NSMutableDictionary alloc]initWithContentsOfFile:fileName];
    self.commClinic = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in mylist[@"desc"])
    {
        [self.commClinic addObject:[[CommClinicIndex alloc] initWithItem:dict]];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commClinic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"comm";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    CommClinicIndex *index = self.commClinic[indexPath.row];
    cell.textLabel.text = index.deptName;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"displayDesc"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [segue.destinationViewController setClinicDesc:self.commClinic[indexPath.row]];
    }
}
@end
