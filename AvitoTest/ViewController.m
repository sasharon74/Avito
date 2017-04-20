//
//  ViewController.m
//  AvitoTest
//
//  Created by Alex on 13.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ViewController.h"

#import "APIClient.h"
#import "UsersRequest.h"
#import "UsersResponse.h"

#import "TableDataSource.h"
#import "SearchTableViewConrollerProtocol.h"

@interface ViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *customSegmentControl;
@property (weak, nonatomic) IBOutlet UISearchBar *customSearchBar;
@property (weak, nonatomic) IBOutlet UIView *customContainerView;

@property (strong, nonatomic) UIViewController <SearchTableViewConrollerProtocol> *currentViewController;
@property (strong, nonatomic) UIViewController <SearchTableViewConrollerProtocol> *itunesTableViewController;
@property (strong, nonatomic) UIViewController <SearchTableViewConrollerProtocol> *githubTableViewController;

//Ограничение быстрого ввода
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupController];
    
    self.customSearchBar.delegate = self;
}

- (void)setupController{
    
    self.currentViewController = self.itunesTableViewController;
    
    [self addChildViewController:self.currentViewController];
    [self.currentViewController.view setFrame:self.customContainerView.bounds];
    [self.customContainerView addSubview:self.currentViewController.view];
}

#pragma mark UISegmentControl

- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    
    self.customSegmentControl.userInteractionEnabled = NO;
    
    UIViewController <SearchTableViewConrollerProtocol> *viewController =
    [self viewControllerForSegmentAtIndex:sender.selectedSegmentIndex];
    
    [self addChildViewController:viewController];
    
    [self transitionFromViewController:self.currentViewController
                      toViewController: viewController
                              duration:0.4
                               options:UIViewAnimationOptionTransitionNone
                            animations:^{
                                
                                [self.currentViewController.view removeFromSuperview];
                                [viewController.view setFrame:self.customContainerView.bounds];
                                [self.customContainerView addSubview:viewController.view];
                            } completion:^(BOOL finished) {
                                
                                //[viewController didMoveToParentViewController:self];
                                self.currentViewController = viewController;
                                self.customSegmentControl.userInteractionEnabled = YES;
                                
                                if (![self.currentViewController.searchStr isEqualToString:self.customSearchBar.text]){
                                    [self perfomSearch];
                                }
                            }];
}


- (UIViewController <SearchTableViewConrollerProtocol> *)viewControllerForSegmentAtIndex:(NSInteger)index {
    
    switch (index) {
        case 0:
            return self.itunesTableViewController;
            break;
        case 1:
            return self.githubTableViewController;
            break;
    }
    return nil;
}

#pragma mark UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    //if (searchText.length == 0) return;
    
    //При быстром вводе символов - не запрашиваем каждый раз обновление таблицы
    
    if(self.timer){
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.2
                                                  target:self
                                                selector: @selector(perfomSearch)
                                                userInfo: nil
                                                 repeats: NO];
}

- (void)perfomSearch{
    [self.currentViewController performSearchWithText:self.customSearchBar.text];
}

#pragma mark Private methods

- (UIViewController *)itunesTableViewController{
    if (!_itunesTableViewController){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ITunesStoryboard" bundle: nil];
        _itunesTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"itunes_view_id"];
    }
    return _itunesTableViewController;
}

- (UIViewController *)githubTableViewController{
    if (!_githubTableViewController){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GitHubStoryboard" bundle: nil];
        _githubTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"github_view_id"];
    }
    return _githubTableViewController;
}

@end
