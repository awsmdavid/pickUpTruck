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
- (IBAction)goBack:(id)sender;
@end

@implementation ViewController
static NSArray *pickUpLinesArray;
static int currentLine = -1;
static int lastPickedLine = -1;
static int penultimatePickedLine = -1;

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//initialize pickUpLines Array
- (void) initPickUpLines{
   
    
    pickUpLinesArray = [NSMutableArray arrayWithObjects: @"Do you believe in love at first sight or should I walk by again?", @"Life without you is like a broken pencil.. \r pointless.", @"Did it hurt?? \r When your father beat you as a child?", @"Do you have a map? \n Cause I think I just got lost in your eyes", @"If beauty were time, you'd be an eternity.", @"Are you a hooker? \n because you sure look like one!", @"You have a twin sister? \n then you must be the most beautiful girl in the world", @"Are your parents mentally handicapped? \n Cause you sure are special!", @"Do you own a jersey? \n Cause I need yo' name and numba!", @"Now I understand why Solomon had over a thousand wives.. \n he must've never met you.", @"You must be really fattening \n because you just made my heart stop!", @"Do you have a name or can I call you mine?", @"If you were a transformer, you'd be called Optimus FINE", @"You look like my first wife.. \n I think you have the same name, birthday, and social too..", @"You shouldn't be wearing all that make-up \n cause you're messing with perfection!", @"Are you lost? \n Cause heaven's a long way from here!", @"Excuse me, can you empty your pockets? \n I believe you've stolen my heart.", @"So I was reading the book of numbers last night and realized I didn't have yours", @"Are you African? \n Cause AFRICAN LOVE YOU", @"If you were a triangle, you'd be an acute one", @"Are you Katniss Everdeen? \n Cause you got my District in an uprising.", @"Your smile’s like expelliarmus: simple but disarming.", @"Feel this sweater. \n It's made of boyfriend material", @"Girl, you must be a boggart \r because you look \r RIDD-IKU-LUS", @"If I were a stoplight, \n I'd turn red everytime you passed by just so I could stare at you longer.", @"Do you have any neosporin? \n Cause I just scraped my knees falling for you.", @"Your eyes are like Apple Maps, \n I keep getting lost in them", @"Did you just fart? \n Because you just blew me away!",@"Are you Irish? \n Cause when I see you, my potato be Dublin!", @"Girl, you're so sweet I could wrap you up and sell you for fundraising!", @"Excuse me, I think I lost my number.. \n Can I barrow yours?", @"This watch tells me that you don't have panties on. \n Oh you do? It must be five minutes fast.", @"Is it hot in here or are your boobs just huge?", @"It's a good thing I brought my library card... \n Cause I'm totally checking you out!", @"If I had a nickel for everytime I saw someone as gorgeous as you I'd have five cents!", @"You're so sweet you could put Hershey out of business!", @"My love for you is like diarrhea, \n I just cant hold it in!", @"People call me Dave, \n but you can call me Tonight!", @"How much does a polar bear weigh? \n Enough to break the ice!", @"Did the sun come up or did you just smile at me?", @"My love for you is like a fart. \n Everything about it is powered by my heart.", @"Are you a parking ticket? \n Because you've got FINE written all over you.", @"I hope you know CPR, because you just took my breath away!", @"Hi, I'm a thief and I'm here to steal your heart.", @"Did the sun just come up or did you just smile at me?", @"If they put you on the menu at McDonalds, \n you'd be the McGorgeous!",@"Hey Girl, there's something on your butt \n My eyes", @"Are you a piece of Carbon? \n Because I would love to date you",@"Are you the square root of -1? \n Cause you can't be real!", @"You are shattering my faith in gravity.",@"If you were a Dementor, I'd cast an unforgivable curse just to get your kiss.", @"If you were x, I'd want to be x^2/2 so that I could be the area under your curve!", @"Can I buy you a drink before happy hour prices are no longer in effect?", @"Do you have any raisins? \n How about a date?",@"Hey you owe me a drink! \n Cause when I saw you I dropped mine!", @"Are you from Holland?? \n because AmsterDAMMMM!", @"See these keys? \n Are any of them the ones to your heart.", @"I was dropped as a child... \n INTO A POOL OF SEXYYY!", @"If beauty could kill, \n You'd be a weapon of mass destruction", @"Are you a biscuit from Red Lobster \n Cause I just can't get enough of you!", @"If beauty could kill, \n You'd be a weapon of mass destruction.", @"Are you a biscuit from Red Lobster \n Cause I just can't get enough of you!", @"You must be tired \n Cause you've been running through my mind all day!", @"If a fat man puts you into a bag at night, don't worry \n I told Santa what I want for Christmas.", @"You smell like trash, \n Can I take you out?", @"Your eyes are as blue as the toilet water in my home!", @"You want to dance with the big bad wolf? \n No? It's okay the other two pigs said 'no' too.", @"What time do you have to head back to heaven?", @"I know you're not a muggle, cause you've cast a spell on me!", nil];
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
        while (lastPickedLine == i || penultimatePickedLine == i){
            i = arc4random() % ([pickUpLinesArray count]);
        }
    }
  
    //write pick up line to label
    NSString *pickUpLine = [pickUpLinesArray objectAtIndex:i];
    penultimatePickedLine = lastPickedLine;
    lastPickedLine=currentLine;
    currentLine = i;
    /*
    //track picked line
    NSNumber* currentNumber = [NSNumber numberWithInteger:i];
    pickedLinesArray 
    */
    
    //print out picked line
    self.pickUpLabel.text = pickUpLine;
    
    //add pick up line to clipboard for copy and paste
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.pickUpLabel.text;
    
}

- (IBAction)goBack:(id)sender {
    if (lastPickedLine>0) {
        //write pick up line to label
        NSString *lastPickUpLine = [pickUpLinesArray objectAtIndex:lastPickedLine];
        self.pickUpLabel.text = lastPickUpLine;
        lastPickedLine= penultimatePickedLine;
        
        //add pick up line to clipboard for copy and paste
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = self.pickUpLabel.text;
    }

}

@end
