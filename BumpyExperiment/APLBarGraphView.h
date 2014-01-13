//
//  APLBarGraphView.h
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APLBarGraphView : UIView

@property (assign) float maxValue;
@property (strong, nonatomic) NSArray *values;

@end
