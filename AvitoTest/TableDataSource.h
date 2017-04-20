//
//  TableDataSource.h
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

@import UIKit;
@protocol CellProtocol;

@protocol TableViewDelegate <NSObject>

@end

typedef void(^ConfigureCellBlock)(id cell, id item, NSIndexPath *indexPath);

@interface TableDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithOddCellClass:(Class <CellProtocol> )oddCellClass
                       evenCellClass:(Class <CellProtocol> )evenCellClass
                  configureCellBlock:(ConfigureCellBlock)configureCellBlock;

@property (nonatomic, strong)   NSArray *items;
@property (nonatomic, weak) id <TableViewDelegate> uiDelegate;

@end
