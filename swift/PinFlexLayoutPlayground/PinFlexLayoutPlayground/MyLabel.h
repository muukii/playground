//
//  MyLabel.h
//  PinFlexLayoutPlayground
//
//  Created by muukii on 3/7/18.
//  Copyright © 2018 muukii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(Hoge)
- (CGSize) _intrinsicSizeWithinSize:(CGSize) targetSize;
- (float) _preferredMaxLayoutWidth;
@end

@interface MyLabel : UILabel

@end

@interface ManualLayoutView : UIView
- (CGSize)autolayout_intrinsicSizeWithinSize:(CGSize) targetSize;
@end
