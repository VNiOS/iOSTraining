//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by Trinhld on 1/22/13.
//
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (copy, nonatomic) NSString *userName;

- (IBAction)changeGreeting:(id)sender;

@end



































