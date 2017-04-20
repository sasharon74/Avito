//
//  ITunesViewController.m
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ITunesViewController.h"

#import "ITunesOddTableViewCell.h"
#import "ITunesEvenTableViewCell.h"

#import "TableDataSource.h"
#import "NetworkManager.h"

#import "AlertViewControllerCreator.h"
#import "InteractionTouchDelegate.h"

#import "ImageViewControllerCreator.h"

@interface ITunesViewController () <InteractionTouchDelegate, TableViewDelegate>

@property (strong, nonatomic) TableDataSource *separateDataSource;

@end

@implementation ITunesViewController

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.separateDataSource = [[TableDataSource alloc]initWithOddCellClass:[ITunesOddTableViewCell class]
                                                             evenCellClass:[ITunesEvenTableViewCell class]
                                                        configureCellBlock:nil];
    
    self.itunesTableView.dataSource = self.separateDataSource;
    self.separateDataSource.uiDelegate = self;
    
    // скрываем лишние разделители клеток
    self.itunesTableView.tableFooterView = [UIView new];

}

#pragma mark InteractionTouchDelegate

-(void)userDidTouch:(UITapGestureRecognizer*)recognizer
              image:(UIImage*)image
               cell:(UITableViewCell <CellProtocol> *)cell{
    
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
    
    [[NetworkManager sharedInstance] getMediaItemsByText:self.searchStr onSuccess:^(NSArray *array) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.separateDataSource.items = array;
            [self.itunesTableView reloadData];
        });
        
    } onFailure:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:[AlertViewControllerCreator getAllertViewController]
                               animated:YES
                             completion:nil];
        });
    }];
    
    
//    [self.searchOperationQueue cancelAllOperations];
//    
//    NSBlockOperation *searchBlockOperation = [NSBlockOperation new];
//    __weak typeof(searchBlockOperation) weakOp = searchBlockOperation;
//    [searchBlockOperation addExecutionBlock:^{
//        
//        typeof(weakOp) strongOp = weakOp;
//        if (!strongOp) {
//            return;
//        }
//
//        
//        MediaItemsRequest *itemsRequest = [[MediaItemsRequest alloc]init];
//        [itemsRequest setSearchStringAttribute:self.searchStr];
//        
//        if (!strongOp.isCancelled){
//            
//            [[APIClient sharedInstance]getItems:^(MediaItemsResponse *response) {
//                if (!strongOp.isCancelled){
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        self.separateDataSource.items = response.items;
//                        [self.itunesTableView reloadData];
//                    });
//                }else{
//                    NSLog(@"CANCEL");
//                }
//            } withAPIRequest:itemsRequest];
//
//        }else{
//            NSLog(@"CANCEL");
//        }
//        
//        
//    }];
//    
//    [self.searchOperationQueue addOperation:searchBlockOperation];
//    
}

@end
