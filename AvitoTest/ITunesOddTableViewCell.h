//
//  ITunesOddTableViewCell.h
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellProtocol.h"

@interface ITunesOddTableViewCell : UITableViewCell <CellProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

+ (UINib *)nib;

@property (nonatomic, strong) id object;

@property (weak, nonatomic) id <InteractionTouchDelegate> delegate;

@end
