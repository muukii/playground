//
//  MyLabel.m
//  PinFlexLayoutPlayground
//
//  Created by muukii on 3/7/18.
//  Copyright © 2018 muukii. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

- (CGSize)intrinsicContentSize {

  CGSize size = [super intrinsicContentSize];
//  NSLog(@"%@ %@", NSStringFromCGSize(size), self);
  return size;
}

- (CGSize) _intrinsicSizeWithinSize:(CGSize) targetSize {

//  NSLog(@"%@ %@", NSStringFromCGSize(targetSize), self);
//  NSLog(@"%f", self._preferredMaxLayoutWidth);
  CGSize size = [super _intrinsicSizeWithinSize: targetSize];
  return size;
}

@end

@implementation ManualLayoutView

- (CGSize)intrinsicContentSize {

  CGSize size = [super intrinsicContentSize];
//  NSLog(@"%@ %@", NSStringFromCGSize(size), self);
  return size;
}

- (CGSize)autolayout_intrinsicSizeWithinSize:(CGSize)targetSize {
  return [super _intrinsicSizeWithinSize:targetSize];
}

- (CGSize) _intrinsicSizeWithinSize:(CGSize) targetSize {

  CGSize size = [self autolayout_intrinsicSizeWithinSize:targetSize];
  return size;
}

@end
