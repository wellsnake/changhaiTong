//
//  SpecialClinicIndexList.m
//  TestTableView
//
//  Created by wellsnake on 13-7-3.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "SpecialClinicIndexList.h"
#import "SpecialClinicIndex.h"
@implementation SpecialClinicIndexList
-(id)initWithArray:(NSMutableArray *)clinicList
{
    self = [super init];
    if (self)
    {
        NSMutableArray *list =[[NSMutableArray alloc] init];
        for (NSDictionary *item in clinicList)
        {
            SpecialClinicIndex *clinicIndex = [[SpecialClinicIndex alloc] initWithItem:item];
            [list addObject:clinicIndex];
        }
        SpecialClinicIndex *firstObject = [list objectAtIndex:0];
        _deptName = firstObject.deptName;
        _clinicIndexList = list;
    }
    return self;
}
@end
