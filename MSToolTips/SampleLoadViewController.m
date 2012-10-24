//
//  SampleLoadViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 24/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "SampleLoadViewController.h"
#import "Contact.h"

@interface SampleLoadViewController ()

@end

@implementation SampleLoadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 1)
    // Alloc the view which shows activity
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // Set it to the right on navigation bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activity];
    
    // Load the JSON from the file
    // The json has been build using http://www.jsoneditoronline.org/ There may be other services
    
    [[DownloadManager shared] loadLocalFileName:@"SampleLoad" withDelegate:self];
    // Yeah, that's as simple. Please note that this is not magic, see DownloadManager for implementation.
    // Basically, I just wanted to keep it simple for you. If you want to know how it works behind the scene, take time to read the code.
    // If your app will be connected, then you just have to replace the previous line with
    //
    //     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:yourURL];
    //     [[DownloadManager shared] loadRequest:request withDelegate:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 5)
    // Return the number of sections.
    return 1; // There is just one section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 6)
    // Return the number of rows in the section.
    return _arrayOfContacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // 7)
    // Handle the cell. Be careful, templates can gives you
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // This is not right for our use, since that's for storyboard implementations. Replace with
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Get the contact for the row
    Contact *c = [_arrayOfContacts objectAtIndex:indexPath.row];
    
    // Display!
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", c.firstName, c.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ — %d", c.job, c.age];
    
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

// 4) implement protocol
#pragma mark - DownloadDelegate protocol

- (void) downloadOperation:(DownloadOperation *)operation didFailWithError:(NSError *)error
{
    // Stop activity indicator
    [_activity stopAnimating];
    NSLog(@"%@", error);
    // Todo : handle the error
}

- (void) downloadOperation:(DownloadOperation *)operation didStartLoadingRequest:(NSMutableURLRequest *)request
{
    // Start the activity indicator
    [_activity startAnimating];
}

- (void) downloadOperation:(DownloadOperation *)operation didLoadObject:(id)object
{
    // Stop activity indicator
    [_activity stopAnimating];
    
    // Now, we need to go through all the objects loaded in the JSON, parse it, and create new Objective-C objects
    // First, remove previous objects in instance array
    [_arrayOfContacts removeAllObjects];
    
    // Allocate it if not already. This is called lazy loading. Remember, we are on mobile devices, where RAM use is really important
    if (!_arrayOfContacts)
        _arrayOfContacts = [NSMutableArray new];
    
    // Now enumerate the json array
    for (NSDictionary *dic in object)
    {
        // Create a new contact
        Contact *c = [Contact new];
        
        // Set its properties from JSON 'object'
        c.firstName = [dic objectForKey:@"FirstName"];
        c.lastName = [dic objectForKey:@"LastName"];
        c.job = [dic objectForKey:@"Job"];
        c.age = [[dic objectForKey:@"Age"] integerValue];
        
        // Add it to the array
        [_arrayOfContacts addObject:c];
    }
    
    // Just for fun, sort the array
    [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES]]];
    
    // Try these
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES]]];
    // [_arrayOfContacts sortUsingDescriptors:[NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES]]];
    // Pretty cool no?
    
    // We are almost done. Please note that the parsing is made here just to avoid complexification. You should always create a model like YouTubeManager class which handles the parsing and give the data to the controller. Remember the MVC pattern
    
    // When we finished, reload the table view
    [self.tableView reloadData];
}

@end
