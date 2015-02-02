//
// Created by Guillaume Lagorce on 31/01/15.
// Copyright (c) 2015 Gl0ub1l. All rights reserved.
//

#import "MoodTableViewCell.h"
#import "Tweet.h"
#import "Tweet+Helpers.h"
#import "POPSpringAnimation.h"
#import "SmileyView.h"
#import <FlatUIKit/FlatUIKit.h>


@interface MoodTableViewCell ()

@property(nonatomic, weak) IBOutlet UIView *graphView;
@property(nonatomic, weak) IBOutlet NSLayoutConstraint *graphViewWidthConstraint;
@property(nonatomic, weak) IBOutlet SmileyView *smileyView;

@end

@implementation MoodTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.graphView.layer.cornerRadius = 4.f;
    self.graphViewWidthConstraint.constant = 0.f;
}

- (void)displayMood
{
    self.graphView.backgroundColor = [self.tweet moodColor];
    
    if(self.tweet.mood != TWMoodUndefined)
    {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
        springAnimation.springBounciness = 20;
        springAnimation.springSpeed = 20;
        springAnimation.toValue = @(MAX(30.f,self.tweet.moodScore * 350.f));
        [self.graphViewWidthConstraint pop_addAnimation:springAnimation forKey:@"layoutAnimation"];
        self.smileyView.moodScore = self.tweet.moodScore;
        self.smileyView.hidden = NO;
    }
    else
    {
        self.smileyView.hidden = YES;
    }

}

@end