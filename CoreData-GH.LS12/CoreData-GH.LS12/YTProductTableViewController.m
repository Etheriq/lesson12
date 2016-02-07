//
//  YTProductTableViewController.m
//  CoreData-GH.LS12
//
//  Created by Yuriy T on 07.02.16.
//  Copyright © 2016 Yuriy T. All rights reserved.
//

#import "YTProductTableViewController.h"
#import "YTDBManager.h"
#import "YTProductViewController.h"
#import "YTProduct.h"

@interface YTProductTableViewController ()

@property (strong, nonatomic) NSMutableArray *products;
@property (strong, nonatomic) IBOutlet UITableView *table;

@end

@implementation YTProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Products";
    
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProductWithProduct:)];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) refreshTable {
    
    self.products = nil;
    self.products = [NSMutableArray arrayWithArray:[[YTDBManager Manager] getProductsInBasketWithId:self.basketId]];
    [self.table reloadData];
}

#pragma mark - Actions

-(void) addProductWithProduct: (nullable YTProduct *) product {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YTProductViewController *productController = [sb instantiateViewControllerWithIdentifier:@"productControllerIdentifier"];
    productController.basketID = self.basketId;
    if ([product isKindOfClass:[YTProduct class]]) {
        productController.product = product;
    }
    
    [self.navigationController pushViewController:productController animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.products count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"product_cell" forIndexPath:indexPath];
    
    YTProduct *product = [self.products objectAtIndex:indexPath.row];
    cell.textLabel.text = product.title;
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YTProduct *product = [self.products objectAtIndex:indexPath.row];
    
    [self addProductWithProduct:product];
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
