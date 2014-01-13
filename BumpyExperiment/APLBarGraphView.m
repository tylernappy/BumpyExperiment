//
//  APLBarGraphView.m
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import "APLBarGraphView.h"

@implementation APLBarGraphView
{
}

- (void)setValues:(NSArray *)values
{
    //Should validate that the values are all NSNumbers here...
    _values = values;
    
    if (self.maxValue == 0)
        self.maxValue = MAX(0,[[self.values valueForKeyPath:@"@max.floatValue"] floatValue]);
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    self.layer.sublayers = nil;
    
    CGFloat columnWidth = self.values.count>0?w/self.values.count:0;
    NSInteger columnNum = 0;
    for (NSNumber *num in self.values)
    {
        if (isnan(num.floatValue))
            continue;
        
        CGFloat rawValue = MAX(0,[num floatValue]);
        
        CGFloat scale = self.maxValue>0?rawValue/self.maxValue:0;
        
        CGRect frame = CGRectMake(columnWidth*columnNum, h, columnWidth, -scale*h);
        
        //inset the frame a little so there is some spacing
        if (columnWidth >= 3)
            frame = CGRectInset(frame, 1, 0);
        
        CALayer *layer = [CALayer layer];
        layer.frame = frame;
        layer.backgroundColor = [UIColor redColor].CGColor;
        
        [self.layer addSublayer:layer];
        
        columnNum++;
    }
    
}

@end
