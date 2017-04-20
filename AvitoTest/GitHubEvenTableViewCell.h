//
//  GitHubTableViewCell.h
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

//@class User;

#import <UIKit/UIKit.h>
#import "CellProtocol.h"

#import "InteractionTouchDelegate.h"

@interface GitHubEvenTableViewCell : UITableViewCell <CellProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;

@property (weak, nonatomic) id <InteractionTouchDelegate> delegate;

+ (UINib *)nib;

@property (nonatomic, strong) id object;

@end
