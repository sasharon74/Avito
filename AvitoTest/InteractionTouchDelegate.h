//
//  Delegate.h
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

@protocol InteractionTouchDelegate <NSObject>

-(void)userDidTouch:(UITapGestureRecognizer*)recognizer
              image:(UIImage*)image
               cell:(UITableViewCell*)cell;

@end
