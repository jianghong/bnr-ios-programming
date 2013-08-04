//
//  QuizViewController.h
//  Quiz
//
//  Created by Jackson on 2013-08-03.
//  Copyright (c) 2013 pandabox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController

{
    int currentQuestionIndex;
    
    //The model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    // The view objects
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

-(IBAction)showQuestion:(id)sender;
-(IBAction)showAnswer:(id)sender;
@end
