INCLUDE globals.ink

VAR interactions = 0
VAR affinity = 0

{ interactions == 0:
    ~ interactions++
    ~ dayInteractions++
    -> MarsFirst
}

{ interactions == 1:
    ~ interactions++
    ~ dayInteractions++
    -> MarsSecond
}

{ interactions == 2:
    ~ interactions++
    ~ dayInteractions++
    -> MarsThird
}

{ interactions == 3:
    -> MarsFourth
}

=== MarsFirst ===

Oh... hi Mars... #speaker:Moon

Oh, hi Moon! It's been a while, hasn't it? #speaker:Mars

Yeah... #speaker:Moon

What's wrong? Are you alright? #speaker:Mars
    * [I broke up with Earth.] Earth and I... we... um... we broke up. #speaker:Moon
        ~ affinity++
        Oh... I'm so sorry. If you don't mind me asking, what happened? #speaker:Mars
    * [I like you.] I... Mars, I... I really like you... #speaker:Moon
        ~ affinity += 2
        Oh! Um, I... I didn't know you felt that way about me... #speaker:Mars
        But what about Earth? I thought you were still orbiting them... #speaker:Mars
    * [I'm just sightseeing.] I'm just... getting some space... #speaker:Moon
        Really? I haven't seen you out of Earth's orbit... well, ever. #speaker:Mars
        Wait... Did you two split? What did they do? #speaker:Mars

- * [They made me feel invisible.] I just felt so... invisible with them. It was like I didn't even exist... even when I would block asteroids for them... #speaker:Moon
        Oh, I'm so sorry... I just assumed that since you were their only moon, they wouldn't ignore you... #speaker:Mars
        Apparently not... #speaker:Moon
* [They wouldn't listen to me about humans.] It was those... humans again. I told Earth to get rid of them, but Earth wouldn't listen to me... even when they l-landed on me... #speaker:Moon
        They LANDED on you? And Earth didn't do anything about it? #speaker:Mars
        I'm not sure they even noticed... #speaker:Moon
        Wow. That's awful. I wanna sock that guy in the crust every time he lets one of those rovers land on me... I can't even imagine how you must've felt. #speaker:Mars
* I... I'd rather not talk about it... #speaker:Moon
    Oh... that's alright. Just know I'm here for you. #speaker:Mars
    Th-thank you... #speaker:Moon

- Both of you are silent for a moment. #speaker: 

Listen, Moon... if you need somewhere to orbit for a while... you can orbit me. #speaker:Mars

R-really? #speaker:Moon

HEY! Not if I have anything to say about it! #speaker:???

What? Oh no, Deimos... #speaker:Mars

You watch as two other moons, Phobos and Deimos, gather near your conversation. #speaker: 

In case you didn't notice, there's already TWO moons here! Three's a crowd! #speaker:Deimos

Mars, you wouldn't r-r-replace me, w-would you? #speaker:Phobos
    * [I don't want to replace you.] I... I don't want... to replace... #speaker:Moon
        ~ affinity++
        Yeah, like I'm buying that! You look like you could fling Phobos into the Asteroid Belt! #speaker:Deimos
        AAAH! Please don't fling me into the Asteroid Belt! #speaker:Phobos
        No one is getting replaced, or flung, or whatever! Moon just needed to talk. #speaker:Mars
    * [Do you two mind?] Hey, do-- do you-- do you mind? #speaker:Moon
        Um, do YOU mind? We were here first! It's not our fault Earth doesn't love you! #speaker:Deimos
        DEIMOS! How could you say that? #speaker:Mars
    * [Three is not that many moons.] Three... isn't that many... #speaker:Moon
        Yeah, Jupiter has like, a hundred! #speaker:Mars
        B-but Mercury and Venus don't have any! #speaker:Phobos
        Yeah, why don't you go trauma-dump to one of them? #speaker:Deimos
        DEIMOS! How could you say that? #speaker:Mars

- ... y'know, maybe I should just leave... #speaker:Moon

Oh, phew! They're leaving! #speaker:Phobos

Phobos, knock it off! ... Moon, wait! #speaker:Mars
    
-> END

=== MarsSecond===

... hi again... #speaker:Moon

Ah! They're back! #speaker:Phobos

Oh, hey Moon. Thanks for coming back. #speaker:Mars

Yeah, welcome back, homewrecker. #speaker:Deimos

Cool it, Deimos. You promised you would be nice this time. #speaker:Mars

Ugh, fine. Moon, Mars thinks we should give you a chance. #speaker:Deimos
    * [We don't have to fight.] Yeah, I think... we could get along... #speaker:Moon
        ~ affinity++
        I'm still not comfortable to just have you show up and join us. Heck, you scared Phobos half to death. #speaker:Deimos
        I-I'd say closer to two-thirds to death... #speaker:Phobos
        -> main
    * [I want to know why you don't like me.] I just want to know... why were you being so rude? #speaker:Moon
        -> rude
    * [You were very rude last time.] I just want to know... why were you being so rude? #speaker:Moon
        -> rude

= rude
Hey, you're not the only one with feelings here. How would you like it if another moon randomly showed up to orbit with you? #speaker:Deimos
    * [I would like that.] ... that sounds nice... #speaker:Moon
        Well, good for you for wanting friends. I'm perfectly fine with having nothing change. #speaker:Deimos
        -> main
    * [I would not like that.] ... that would be weird... #speaker:Moon
        Exactly. #speaker:Deimos
        -> main
    
= main
So excuse me if I'm not exactly keen on you showing up unannounced. #speaker:Deimos
    * [That's understandable.] I guess... that makes sense. #speaker:Moon
        But that's still not an excuse to be mean to them. #speaker:Mars
        Eh, I'd probably just ignore you. But it's not my fault if Phobos gets scared and I have to say something. #speaker:Deimos
    * What about Phobos? #speaker:Moon
        ~ affinity += 2
        What about them? #speaker:Deimos
        Deimos, you had the exact same reaction when Phobos showed up here. Now you two are inseparable. Couldn't you extend the same camaraderie to Moon? #speaker:Mars
        ... I suppose... but I can't promise it would be today. Or anytime soon. #speaker:Deimos

- Wait... where is Phobos, anyway? #speaker:Mars

You look around, but Phobos is nowhere to be seen. #speaker: 

Great. They're probably hiding from you, Moon. #speaker:Deimos

I'll talk to them and try to get them calm enough to talk to Moon. You'll probably have to leave us alone for a bit, but I'll let you know when you can come back, OK? #speaker:Mars

Yeah, okay. #speaker:Moon

-> END

=== MarsThird ===

Hi again... is this a good time? #speaker:Moon

Yeah I think so... Phobos? #speaker:Mars

Phobos appears from behind Mars and sheepishly approaches you. #speaker: 
    * [I didn't mean to scare you.] Hey... I didn't mean to scare you. I'm sorry. #speaker:Moon
        ~ affinity++
        I-it's fine. I get scared by a lot of things. #speaker:Phobos
        Just so you know, I'm not really scared of you... like, you as a celestial body. #speaker:Phobos
    * [I'm not going to replace you.] You're going to stay here. I won't... replace you. #speaker:Moon
        I... wasn't really scared that you would kick me out completely. #speaker:Phobos
    * [(wait for Phobos to say something)] ... #speaker:Moon
        Just so you know, I'm not really scared of you... like, you as a celestial body. #speaker:Phobos

- It's more like I was scared that... I would be forgotten. #speaker:Phobos
    * [Mars would never forget you.] Phobos... Mars would never forget you. #speaker:Moon
        ~ affinity++
        Maybe not on purpose... but Deimos is the first, and you would be the newest. And where would that put me? #speaker:Phobos
        Phobos, I talked with Jupiter earlier. They have almost a hundred moons orbiting them, and yet they make sure none of them are ever left out. #speaker:Mars
        If they can do that, we can too. And I would never forget you, with Moon or without. #speaker:Mars
        -> cry
    * [Deimos would never forget you.] Deimos would never forget you. They said as much last time I was here. #speaker:Moon
        -> deimos
    * [I would never forget you.] Phobos... I know what it's like to be forgotten like that. #speaker:Moon
        ~ affinity += 2
        R-really? #speaker:Phobos
        Earth would always ignore me for whatever was going on with the humans on the surface. I was their only moon, too. #speaker:Moon
        And... it was miserable. It was a big part of why I left them. #speaker:Moon
        I don't want that to happen to anyone. So I'll never forget you, and Mars won't either. #speaker:Moon
        -> cry

= cry

Th-thank you. I really needed to hear that. #speaker:Phobos

Now if you'll excuse me, I'm going to go cry. #speaker:Phobos

Phobos drifts away, again hiding behind Mars. #speaker: 

Oh, don't worry about Phobos. They just get exhausted emotionally after being scared for too long. #speaker:Deimos

-> main

= deimos

Hey! I did not! #speaker:Deimos

... not that you're wrong about that. But I didn't tell you! #speaker:Deimos

You mean it? You wouldn't forget me? #speaker:Phobos

Are you kidding? You're my best friend in the whole universe. Moon can take Mars away frm us, but they can never take me away from you. #speaker:Deimos

Th-thank you. I really needed to hear that. #speaker:Phobos

... WAIT IS MOON TAKING MARS AWAY FROM US??? #speaker:Phobos

Wait, that's not what I-- aaaaand there they go. #speaker:Deimos

Phobos had already darted back behind Mars in a panic. #speaker: 

Yeah, this one's on me. Don't worry, I'll go talk to them. #speaker:Deimos

-> main

= main

So now that you two have gotten a chance to know Moon better, do they have your blessing to orbit with us? #speaker:Mars

Ugh, this again. I guess I'm not completely opposed to it anymore, but I don't want to say yes without talking it over with Phobos first. Gimme some time, alright? #speaker:Deimos

Uh, yeah. Sure thing. #speaker:Moon

You watch as Deimos retreats behind Mars to talk to Phobos. #speaker: 

Thanks for being so kind to them. I know they can be a bit hostile to strangers, but they're really not bad when you get to know them. #speaker:Mars

I'll let you know what they decide. I'm hoping they can finally accept you. #speaker:Mars

Yeah... I hope so too. #speaker:Moon

-> END

=== MarsFourth ===

Hi... you wanted to talk to me again? #speaker:Moon

Yeah, the twins had something they wanted to say... #speaker:Mars

Hey Moon, I wanted to apologize for being a jerk to you. It was probably uncalled for. #speaker:Deimos

And I wanted to say sorry for getting so worked up. Though, it will definitely happen again. #speaker:Phobos

We also wanted to say that if you still wanted to orbit Mars, that would be cool with us. #speaker:Deimos

Though, if you've found another planet to orbit by now, I totally understand. #speaker:Mars

Mars... I would love to orbit you. You've meant the world to me for as long as I can remember. #speaker:Moon

And I would love to have you by my side. And I'm sure these two would agree. #speaker:Mars

Well, I wouldn't go THAT far... #speaker:Deimos

And so, Moon joined Phobos and Deimos in their orbit around Mars. And they were loved, and none were forgotten. #speaker: 

-> END