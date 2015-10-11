//
//  LoginViewController.m
//  Kickback
//
//  Created by Mallikarjun Patil on 10/10/15.
//  Copyright © 2015 Mallikarjun. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginButtonPressed:(id)sender {
    
    [PFUser logInWithUsernameInBackground:_username.text password:_password.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"USer logged in successfully!!");
                                            [self performSegueWithIdentifier:@"loginToMap" sender:self];
                                            
                                        } else {
                                            NSLog(@"error %@", [error userInfo][@"error"]);
                                            [_statusLabel setText:@"Unable to Login"];
                                        }
                                    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"loginToMap"])
    {
        //prepare for segue signUpToHome
        UIViewController *mapViewController = [segue destinationViewController];
    }
}

@end
