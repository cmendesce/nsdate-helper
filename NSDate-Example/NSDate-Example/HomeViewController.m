//
//  HomeViewController.m
//  NSDate-Example
//
//  Created by Carlos Mendes on 20/10/13.
//  Copyright (c) 2013 Carlos Mendes. All rights reserved.
//

#import "HomeViewController.h"
#import "NSDate+Helper.h"

@interface HomeViewController ()

@property (strong, nonatomic) NSMutableArray *dates;

@end

@implementation HomeViewController

-(NSMutableArray *)dates {
    if (!_dates) {
        _dates = [[NSMutableArray alloc] init];
    }
    return _dates;
}

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.navigationItem.title = @"NSDate+Helper Examples";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDate *now = [NSDate date];
    
    [self.dates addObject:[now stringWithFormat:@"dd-MM-yyyy"]];
    [self.dates addObject:[now string]];
    [self.dates addObject: [NSString stringWithFormat:@"%i",[now daysAgo]]];
    [self.dates addObject: [NSString stringWithFormat:@"%i",[now daysAgoAgainstMidnight]]];
    [self.dates addObject:[now stringDaysAgo]];
    //[self.dates addObject:[NSDate dateFromString:@"12-12-2013" withFormat:@"dd-MM-yyyy"]];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dates].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.dates[indexPath.row];
    
    return cell;
}

@end