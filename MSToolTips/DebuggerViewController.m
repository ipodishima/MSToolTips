//
//  DebuggerViewController.m
//  MSToolTips
//
//  Created by Marian Paul on 03/10/12.
//  Copyright (c) 2012 Marian Paul. All rights reserved.
//

#import "DebuggerViewController.h"
#import "DebuggerDetailViewController.h"

#import "YouTubeVideo.h"

@interface DebuggerViewController ()

@end

@implementation DebuggerViewController

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

    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:_activity]];
    
    [[YouTubeManager shared] setYouTubeUsername:@"iPuPsarl"];
    [[YouTubeManager shared] setDelegate:self];
    [[YouTubeManager shared] loadDataFromOffset:1];
}

#pragma mark - YoutubeDelegate

- (void)youTubeManagerDidStartToLoad:(YouTubeManager *)manager
{
    [_activity startAnimating];
}

- (void)youTubeManager:(YouTubeManager *)manager didFailWithError:(NSError *)error
{
    [_activity stopAnimating];
}

- (void)youTubeManager:(YouTubeManager *)manager didLoadVideos:(NSArray *)videos
{
    [_activity stopAnimating];

    if (!_arrayToDisplay)
        _arrayToDisplay = [[NSMutableArray alloc] init];
    
    [_arrayToDisplay removeAllObjects];
    [_arrayToDisplay addObjectsFromArray:videos];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _arrayToDisplay.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    YouTubeVideo *video = [_arrayToDisplay objectAtIndex:indexPath.row];
    cell.textLabel.text = video.title;
    cell.detailTextLabel.text = video.caption;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    DebuggerDetailViewController *detailViewController = [[DebuggerDetailViewController alloc] initWithNibName:@"DebuggerDetailViewController" bundle:nil];
    
    detailViewController.video = [_arrayToDisplay objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
