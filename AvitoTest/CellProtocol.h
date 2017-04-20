//
//  CellProtocol.h
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "InteractionTouchDelegate.h"

@protocol CellProtocol <NSObject>

@property (nonatomic, strong) id object;

- (instancetype)initWithReuseID:(NSString *)reuseID;
+ (NSString *)reuseIdentifier;

@property (weak, nonatomic) id <InteractionTouchDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@end
