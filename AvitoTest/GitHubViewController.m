//
//  GitHubViewController.m
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "GitHubViewController.h"

#import "GitHubOddTableViewCell.h"
#import "GitHubEvenTableViewCell.h"

#import "TableDataSource.h"

#import "NetworkManager.h"
#import "ImageViewControllerCreator.h"
#import "InteractionTouchDelegate.h"

#import "AlertViewControllerCreator.h"

@interface GitHubViewController () <InteractionTouchDelegate, TableViewDelegate>

@property (strong, nonatomic) TableDataSource *separateDataSource;

@end

@implementation GitHubViewController

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.separateDataSource = [[TableDataSource alloc]initWithOddCellClass:[GitHubOddTableViewCell class]
                                                             evenCellClass:[GitHubEvenTableViewCell class]
                                                        configureCellBlock:nil];
    self.separateDataSource.uiDelegate = self;
    
    self.gitHubTableView.dataSource = self.separateDataSource;
    
    // скрываем лишние разделители клеток
    self.gitHubTableView.tableFooterView = [UIView new];
}

#pragma mark InteractionTouchDelegate

-(void)userDidTouch:(UITapGestureRecognizer*)recognizer image:(UIImage*)image cell:(UITableViewCell <CellProtocol> *)cell{
    
    CGRect initialFrame = [self.view convertRect:cell.cellImageView.frame
                                        fromView:cell.contentView];
    //quick fix
    //Добавляем origin y нашего container view (подложки под таблицу)
    initialFrame.origin.y += 100;
    
    UIViewController *imageViewController =
    [ImageViewControllerCreator getImageViewControllerWithImage:image
                                                          frame:initialFrame
                                                   oldImageView:cell.cellImageView];
    [self presentViewController:imageViewController animated:YES completion:nil];
    cell.cellImageView.alpha = 0.0;
}

#pragma mark SearchTableViewConrollerProtocol

- (void)performSearchWithText:(NSString *)text{
    
    self.searchStr = text;
    
    [[NetworkManager sharedInstance] getUsersByText:self.searchStr onSuccess:^(NSArray *array) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.separateDataSource.items = array;
            [self.gitHubTableView reloadData];
        });
        
    } onFailure:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:[AlertViewControllerCreator getAllertViewController]
                               animated:YES
                             completion:nil];
        });
    }];
}

@end
