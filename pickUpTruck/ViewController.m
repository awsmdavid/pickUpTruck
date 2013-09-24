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
   
    
    pickUpLinesArray = [NSMutableArray arrayWithObjects: @"Do you believe in love at first sight or should I walk by again?", @"Life without you is like a broken pencil... \r pointless.", @"Did it hurt?? \r When you fell from heaven?", @"Do you have a map? \n Cause I think I just got lost in your eyes.", @"If beauty were time, you'd be an eternity.", @"Are you a hooker? \n because you sure look like one!", @"Do you have a twin sister? \n No? Then you must be the most beautiful girl in the world.", @"Are your parents mentally handicapped? \n Cause you sure are special!", @"Do you own a jersey? \n because I need your name and number!", @"Now I understand why Solomon had over a thousand wives... \n he must've never met you.", @"You must be really fattening \n because you just made my heart stop!", @"Do you have a name or can I call you mine?", @"If you were a transformer, you'd be called Optimus FINE!", @"I've never been married... \n but you look like my first wife!", @"You shouldn't be wearing all that make-up... \n Because you're messing with perfection!", @"Are you lost ma'am? \n Because heaven's a long way from here!", @"Excuse me, can you empty your pockets? \n I believe you've stolen my heart.", @"So I was reading the book of Numbers last night and realized I didn't have yours.", @"Are you African? \n Cause AFRICAN LOVE YOU!", @"If you were a triangle, \n you'd be acute one.", @"Are you Katniss Everdeen? \n Cause you got my District in an uprising.", @"Your smile’s like expelliarmus: simple but disarming.", @"Feel this sweater. \n It's made of boyfriend material.", @"Girl, you must be a boggart \n because you look \n RIDD-IKU-LUS", @"If I were a stoplight, \n I'd turn red everytime you passed by just so I could stare at you a bit longer.", @"Do you have any neosporin? \n Cause I just scraped my knees falling for you.", @"Your eyes are like Apple Maps, \n I keep getting lost in them", @"Did you just fart? \n Because you just blew me away!",@"Are you Irish? \n Cause when I see you, my heart rate be Dublin!", @"Girl, you're so sweet I could wrap you up and sell you for fundraising!", @"Excuse me, I think I lost my number... \n Can I borrow yours?", @"This watch tells me that you don't have panties on. \n Oh you do? \n It must be five minutes fast.", @"Is it hot in here or is your butt just huge?", @"It's a good thing I brought my library card... \n Cause I'm totally checking you out!", @"If I had a nickel for everytime I saw someone as gorgeous as you I'd have five cents!", @"You're so sweet you could put Hershey out of business!", @"My love for you is like diarrhea, \n I just cant hold it in!", @"People call me Dave, \n but you can call me Tonight!", @"How much does a polar bear weigh? \n Enough to break the ice!", @"Did the sun come up or did you just smile at me?", @"My love for you is like a fart. \n Everything about it is powered by my heart.", @"Are you a parking ticket? \n Because you've got FINE written all over you.", @"I hope you know CPR, because you just took my breath away!", @"Hi, I'm a thief and I'm here to steal your heart.", @"Did the sun just come up or did you just smile at me?", @"If they put you on the menu at McDonalds, \n you'd be the McGorgeous!",@"Hey Girl, there's something on your butt. \n My eyes.", @"Are you a piece of Carbon? \n Because I would love to date you!",@"Are you the square root of -1? \n Cause you can't be real!", @"You are shattering my faith in gravity.",@"If you were a Dementor, I'd cast an unforgivable curse just to get your kiss.", @"If you were x, I'd want to be x^2/2 so that I could be the area under your curve!", @"Can I buy you a drink before happy hour prices are no longer in effect?", @"Do you have any raisins? \n How about a date?",@"Hey you owe me a drink! \n Cause when I saw you I dropped mine!", @"Are you from Holland?? \n Cause AmsterDAMMMM!", @"See these keys? \n Are any of them the one to your heart?", @"I was dropped as a child... \n INTO A POOL OF SEXYYY!", @"If beauty could kill, \n You'd be a weapon of mass destruction.", @"Are you a biscuit from Red Lobster? \n Cause I just can't get enough of you!", @"If beauty could kill, \n You'd be a weapon of mass destruction.", @"You must be tired \n Cause you've been running through my mind all day!", @"If a fat man puts you into a bag at night, don't worry, \n I told Santa what I want for Christmas.", @"You look like trash, \n Can I take you out?", @"Your eyes are as blue as the toilet water in my home.", @"You want to dance with the big bad wolf? \n It's okay the other two pigs said 'No' too.", @"What time do you have to be back to heaven?", @"I know you're not a muggle, \n Cause you've cast a spell on me!", @"Are you a child predator? \n because you just abducted my heart!", @"Excuse me, I think you have something in your eyes \n Oh wait, it's just a sparkle.", @"Is that top felt? \n No?? Would you like it to be?", @"Hey I just realized this, \n but you look a lot like my next girlfriend.", @"You know what? \n Your eyes are the same color as my Porsche.", @"Are your pants on sale? \n Cause if you were at my house, they'd be 100% off!", @"Are you from Tennessee? \n Cause you're the only Ten I See!", @"Are you Jamaican? \n 'Cuz JAMAICAN me CRAZY!", @"If you were a booger, \n I'd pick you first!", @"If I had a garden, I'd put my two lips and your two lips together!", @"Let's commit the perfect crime, \n I'll steal your heart and you steal mine.", @"I think there's something wrong with my eyes \n because I can't take them off of you.", @"Is beautiful a color? \n because if it is, that's the color of your eyes.", @"Remember me? \n Oh, that’s right, We’ve only met in my dreams.", @"Wow, I'm so glad I'm not blind!", @"Is it hot in here, \n or is just you?", @"Are you a brain parasite? \n Cause I can't get you of my mind!", @"I'm sorry, you might be asked to leave early, \n You're making all the other girls look bad.", @"Are you wearing space pants? \n Because your butt is out of this world!", @"Are you sure you're not a tower? \n Because Eiffel for you.", @"You must be made of Kryptonite \n because being around you makes my knees weak!", @"If you were a president, \n you'd be Babe-raham Lincoln.", @"Arrrrgg, I must be huntin' treasure, \n 'cause I'm diggin' yer chest!", @"I wish I were Ethiopian \n so I could be right next to Djibouti", @"For you I would slay two Goliaths.", @"I didnt believe in predestination until tonight.", @"The Bible says 'Give drinks to those who are thirsty, and feed those who are hungry'; \n how about dinner and a drink?", @"Bathsheba had nothing on you.", @"Hi, I'm Joshua \n How many times do I have to walk around you to make you fall for me?", @"When I read philippians 4:8, I think about you.", @"Unfortunately I cant perform miracles and I've only got enough bread and fish for 2 people.", @"You must be Cinderella, \n because I see that dress disappearing by midnight.", @"Call me Pooh, \n because all I want is you, honey.", @"Can I call you Mary \n Cause you are POPPIN!",@"My name isn't Scully, \n but you can still be my Boo.", @"I must be Lighting McQueen, \n 'cause you've got my heart racing.", @"Do you sew? \n Because I'm totally ripped.", @"I wish this gym had a stationary bike built for two.", @"My name may not be Luna, \n but I sure know how to Lovegood!", @"Is your name Google? \n Because you have everything I've been searching for.", @"Is your name linksys? \n Cause I feel an unsecure connection!", @"Are you an alcoholic? \n Cause you have got me intoxicated.", @"Are you an interior decorator? \n 'Cause when I saw you, the room became beautiful.", @"Be unique and different, \n say yes.", @"I wish I were your socks \n so I can be with you every step of the way.", @"You're so beautiful that you made me forget my pickup line.", @"Is there an airport nearby? \n  Cause I think my heart is about to take off!", @"Excuse me, I think you dropped something \n MY JAW", @"I'll bet you $20 you turn me down!", @"Would you grab my arm so I can tell my friends I've been touched by an angel?", @"Did you sit in a pile of sugar? Cause you have a pretty sweet butt.", @"You're like a candy bar \n half sweet, half nuts!", nil];
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
