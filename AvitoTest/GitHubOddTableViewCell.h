//
//  GitHubOddTableViewCell.h
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellProtocol.h"

@interface GitHubOddTableViewCell : UITableViewCell <CellProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;

+ (UINib *)nib;

@property (weak, nonatomic) id <InteractionTouchDelegate> delegate;

@property (nonatomic, strong) id object;

@end
