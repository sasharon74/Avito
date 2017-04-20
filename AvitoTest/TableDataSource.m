//
//  TableDataSource.m
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "TableDataSource.h"
#import "CellProtocol.h"

#import "GitHubOddTableViewCell.h"
#import "GitHubViewController.h"

@interface TableDataSource ()

@property (nonatomic, copy)     ConfigureCellBlock configureCellBlock;

@property (nonatomic, strong) Class <CellProtocol> oddCellClass;
@property (nonatomic, strong) Class <CellProtocol> evenCellClass;

@end

@implementation TableDataSource

#pragma mark Initial

- (instancetype)initWithOddCellClass:(Class <CellProtocol> )oddCellClass
                       evenCellClass:(Class <CellProtocol> )evenCellClass
                  configureCellBlock:(ConfigureCellBlock)configureCellBlock{
    self = [super init];
    if (self){
        _oddCellClass = oddCellClass;
        _evenCellClass = evenCellClass;
        _configureCellBlock = [configureCellBlock copy];
    }
    return self;
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell <CellProtocol> *cell;
    if (indexPath.row % 2 == 0){
        
        cell = [tableView dequeueReusableCellWithIdentifier:[self.oddCellClass reuseIdentifier]];
        if (cell == nil){
            
            cell = [[(Class)self.oddCellClass alloc]initWithReuseID:[self.oddCellClass reuseIdentifier]];
        }
    }else{
        
        cell = [tableView dequeueReusableCellWithIdentifier:[self.evenCellClass reuseIdentifier]];
        if (cell == nil){
            
            cell = [[(Class)self.evenCellClass alloc]initWithReuseID:[self.evenCellClass reuseIdentifier]];
        }
    }
    id item = self.items[indexPath.row];
    cell.delegate = (UIViewController <InteractionTouchDelegate> *)self.uiDelegate;
    [cell setObject:item];
    return cell;
}

@end
