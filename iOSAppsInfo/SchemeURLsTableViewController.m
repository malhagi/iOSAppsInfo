//
//  SchemeURLsTableViewController.m
//  iOSAppsInfo
//
//  Created by 吴建国 on 15/11/14.
//  Copyright © 2015年 wujianguo. All rights reserved.
//

#import "SchemeURLsTableViewController.h"
#import "LMAppController.h"

@interface SchemeURLsTableViewController ()
@property (nonatomic) NSInteger schemeType;
@property (nonatomic, retain) NSArray *publicURLSchemes;
@property (nonatomic, retain) NSArray *privateURLSchemes;
@end

@implementation SchemeURLsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.schemeType = 0;
    self.publicURLSchemes = [[LMAppController sharedInstance] publicURLSchemes];
    self.privateURLSchemes = [[LMAppController sharedInstance] privateURLSchemes];
}

- (IBAction)schemeTypeChanged:(UISegmentedControl *)sender {
    self.schemeType = sender.selectedSegmentIndex;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.schemeType == 0) {
        return [self.publicURLSchemes count];
    } else {
        return [self.privateURLSchemes count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchemeTableViewCellIdentifier" forIndexPath:indexPath];
    if (self.schemeType == 0) {
        cell.textLabel.text = self.publicURLSchemes[indexPath.row];
    } else {
        cell.textLabel.text = self.privateURLSchemes[indexPath.row];
    }
    return cell;
}

@end
