//
//  SignUpViewController.m
//  Kickback
//
//  Created by Mallikarjun Patil on 10/10/15.
//  Copyright © 2015 Mallikarjun. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.descriptionTextView.layer.borderWidth = 1.0f;
    self.descriptionTextView.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.descriptionTextView setText:@"Description"];
    
    self.address.layer.borderWidth = 1.0f;
    self.address.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.address setText:@"Address"];
    
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
    
    
}

-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signupButtonPressed:(id)sender {
    
    PFUser *user = [PFUser user];
    user.username = [_username text];
    user.password = [_password text];
    user[@"firstName"] = [_name text];
    user[@"age"] = [_age text] ;
    user[@"phoneNumber"] = [_phoneNumber text];
    user[@"address"] = [_address text];
    user[@"description"] = [_descriptionTextView text];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            NSLog(@"Insertion successful. Move to Home Page");
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"errorString %@", errorString);
        }
    }];
    
}


@end
