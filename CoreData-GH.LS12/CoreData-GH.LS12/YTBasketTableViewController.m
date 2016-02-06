//
//  YTBasketTableViewController.m
//  CoreData-GH.LS12
//
//  Created by Yuriy T on 06.02.16.
//  Copyright © 2016 Yuriy T. All rights reserved.
//

#import "YTBasketTableViewController.h"
#import "YTDBManager.h"
#import "YTBascketCell.h"
#import "YTBasketViewController.h"
#import "YTBasket.h"

@interface YTBasketTableViewController ()

@property(strong, nonatomic) NSMutableArray *baskets;
@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation YTBasketTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[YTDBManager Manager] removeAllBasckets];  //   !!!
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBascket)];

}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self refreshTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refreshTable {
    self.baskets = nil;
    self.baskets = [NSMutableArray arrayWithArray:[[YTDBManager Manager] getAllBaskets]];
    [self.table reloadData];
}

#pragma mark - Actions

-(void) addBascket {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YTBasketViewController *basketController = [sb instantiateViewControllerWithIdentifier:@"bascketControllerIdentifier"];
  
    [self.navigationController pushViewController:basketController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.baskets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YTBascketCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basketCell" forIndexPath:indexPath];
    YTBasket *basket = [self.baskets objectAtIndex:indexPath.row];
    cell.title.text = [NSString stringWithFormat:@"%@", basket.title];

    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd MMMM yyyy"];
    cell.createdAtDate.text = [NSString stringWithFormat:@"%@", [format stringFromDate:basket.createdAt]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
