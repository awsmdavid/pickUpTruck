//
//  ViewController.m
//  pickUpTruck
//
//  Created by David Cheng on 5/17/13.
//  Copyright (c) 2013 David Cheng. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pickUpLabel;
- (IBAction)changePickUp:(id)sender;

@end

@implementation ViewController

static NSArray *pickUpLinesArray;
static int lastPickedLine = -1;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//initialize pickUpLines Array
- (void) initPickUpLines{
    
    pickUpLinesArray = [NSMutableArray arrayWithObjects: @"Do you believe in love at first sight or should I walk by again?", @"Life without you is like a broken pencil.. \r pointless.", @"Did it hurt?? \r When your father beat you as a child?", @"Do you have a map? \n Cause I think I just got lost in your eyes", @"If beauty were time, you'd be an eternity.", @"Are you a hooker? \n because you sure look like one!", @"You have a twin sister? \n then you must be the most beautiful girl in the world", @"Are your parents mentally handicapped? \n Cause you sure are special!", @"Do you own a jersey? \n Cause I need yo' name and numba!", @"Now I understand why Solomon had 500 wives.. \n he must've never met you.", @"You must be really fattening \n because you just made my heart stop!", @"Do you have a name or can I call you mine?", @"Are you a transformer? \n Cause you are Optimus FINEE", @"You look like my first wife.. \n luckily I've never been married", @"You shouldn't be wearing all that make-up \n cause you're messing with perfection!",@"Are you lost? \n cause heaven's a long way from here!", @"Excuse me, can you empty your pockets? \n I believe you've stolen my heart", nil];
}

//change pick up line method
- (IBAction)changePickUp:(id)sender {

    //call init pick up lines array
    [self initPickUpLines];
    
    //generate random number
    int arrayLength = [pickUpLinesArray count];
    int i = arc4random() % arrayLength;
    
    //ensure no duplicates
    if (lastPickedLine > -1){
        while (lastPickedLine == i){
            i = arc4random() % ([pickUpLinesArray count]);
        }
    }
    lastPickedLine = i;
    
    //write pick up line to label
    NSString *pickUpLine = [pickUpLinesArray objectAtIndex:i];
    self.pickUpLabel.text = pickUpLine;
}
@end
