//
//  ItemViewController.m
//  Northstar Cafe Orderer
//
//  Created by Jeremiah Bunton on 12/12/14.
//  Copyright (c) 2014 Jeremiah Bunton. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()

@end

@implementation ItemViewController






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
    // Do any additional setup after loading the view.
    
}


// Must have this method implemented to tell the UITableView how many rows it needs to prepare for.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"printing the number of items in the menu +++++++++++++");
    NSLog(@"%lu", (unsigned long)[_menu count]);
    return [_menu count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Get each menuItem for each row
    MenuItem *item = [_menu objectAtIndex:indexPath.row];
    //NSLog(@"Printing menuItem ++++++++++++++");
    //[item toString];
    
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.price;
    
    return cell;
}


-(void)setUser:(NSString *)user{
    _user = user;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    OrderConfirmationViewController *ocvc = [segue destinationViewController];
    
    [ocvc setMenuItem:[_menu objectAtIndex:indexPath.row]];
    [ocvc setUser:_user];
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
