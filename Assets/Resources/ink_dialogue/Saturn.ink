INCLUDE globals.ink

{ satInteractions >= currentDay:
    -> already_interacted
}

{ satInteractions == 0:
    ~ satInteractions++
    ~ dayInteractions++
    -> SaturnFirst
}

{ satInteractions == 1:
    ~ satInteractions++
    ~ dayInteractions++
    -> SaturnSecond
}

{ satInteractions == 2:
    ~ satInteractions++
    ~ dayInteractions++
    -> SaturnThird
}

{ satInteractions == 3:
    -> SaturnFourth
}

=== already_interacted ===

Saturn doesn't seem interested in talking to you. #speaker: 

-> END
    
=== SaturnFirst ===

Um... h-hello? #speaker:Moon

Well, hello there, gorgeous! Name's Saturn. Yours? #speaker:Saturn

Uh... I-I'm Moon... #speaker:Moon

Mmm... nah. Way too generic. That's like if I was named "Planet." #speaker:Saturn

I'm gonna call you "Luna." How's that sound? #speaker:Saturn
    * [I like it.] Ummm... that actually... that's pretty good... #speaker:Moon
        ~ satAffinity++
        I should hope so. A beautiful face like yours should have a beautiful name to go with it. #speaker:Saturn
    * [I'm not so sure.] I... uh, I don't know... #speaker:Moon
        Ah don't worry, you'll get used to it. #speaker:Saturn
    * [You don't get to pick my name.] You... uh, you don't get... uh... #speaker:Moon
        ~ satAffinity++
        Awestruck, right? Yeah darling, I've seen it before. Happens all the time. #speaker:Saturn
    
- Now, what brings you down to Saturn Town? #speaker:Saturn
    * [I'm looking for another planet to orbit.] I'm... looking for... something to orbit.... #speaker:Luna
        -> another_planet
    * [I want to be your moon.] I... I want to be... your moon? #speaker:Luna
        Ah, you flatter me, darling! You and everyone else, though! #speaker:Saturn
        You suddenly notice that Saturn is surrounded by moons. #speaker: 
        Hey. #speaker:Titan
        They seem mostly disinterested in you. #speaker: 
        Awesome, right? And it's no wonder why. After all, check THESE out! #speaker:Saturn
        -> main
    * [Just sightseeing.] Oh, just... looking around. #speaker:Luna
        Well, you've found the right place to look around! Check THESE out! #speaker:Saturn
        -> main

= another_planet

Orbit? Darling, I'm the KING of orbits! Check out all the moons I've got orbiting right now! #speaker:Saturn

You suddenly notice that Saturn is surrounded by moons. #speaker: 

Hey. #speaker:Titan

They seem mostly disinterested in you. #speaker: 

Awesome, right? No small feat that is, either. So, you need some advice? #speaker:Saturn
    * [I could use some advice.] Advice would be nice... #speaker:Luna
    * [I need you ;)] More like I... uh... I need... #speaker:Luna
        Oh darling, whatever it is that you need, you need my advice more. #speaker:Saturn
        
- Alright, Rule Number 1 is Confidence. You gotta be able to sell yourself, and you're not gonna do that without sounding confident. #speaker:Saturn

Rule Number 2 is Uniqueness. You gotta make yourself stand out from the pack. Figure out something that makes you unique and sell it. For example, check THESE out! #speaker:Saturn

-> main

= main

Saturn makes a point of showing off their rings, tilting them so Sun's light reflects off them and blinds you. #speaker: 
    * [They're very cool rings.] They're... very cool. #speaker:Luna
        Yeah, I get that a lot. #speaker:Saturn
    * [They're not that cool.] They're... not really that cool. #speaker:Luna
        ~ ringsInsulted = true
        You notice that Saturn's moons, previously uninterested, are now staring at you. Saturn looks appalled. #speaker: 
        WHAT?? H-how could you say that? The most magnificent rings in the solar system, and they're NOT THAT COOL? #speaker:Saturn
        ... whatever. I'll just... pretend you didn't say that, OK? OK. #speaker:Saturn
    
- Anyway, if you're looking to become one of my moons (and you TOTALLy are-- it's sooo obvious) #speaker:Saturn

... then you'll need to take my quiz. #speaker:Saturn

Q-quiz? #speaker:Luna

It's not personal, darling. I just need a vetting process on account of how many moons want to be mine. #speaker:Saturn

Let me just grab my slide deck and... hmm. Rhea, where's my slide deck? #speaker:Saturn

How should I know? I never touched that damn thing. #speaker:Rhea

Hmm. Well, come back later and I'll get you quizzed up in no time flat, darling. #speaker:Saturn

-> END

=== SaturnSecond ===

I'm back... #speaker:Luna

Ah, excellent timing, darling! I found my slide deck, so we can continue with the quiz. Gather round, everyone! #speaker:Saturn

The moons crowd around you while Saturn pulls out a stack of index cards with "Rizz Quiz" printed on the back. #speaker: 

OK! Question 1 - How many planets orbit between Saturn and the sun? Not including myself, of course. #speaker:Saturn
    * 4 #speaker:Luna
        Oh, that's not right! The correct answer was 5! But don't worry, you're not eliminated yet. #speaker:Saturn
    * 5 #speaker:Luna
        5 is correct! Though, let's be real here, that was an easy one. #speaker:Saturn
    * 6 #speaker:Luna
        Oh, that's not right! The correct answer was 5! But don't worry, you're not eliminated yet. #speaker:Saturn
    * 7 #speaker:Luna
        Oh, that's not right! The correct answer was 5! But don't worry, you're not eliminated yet. #speaker:Saturn

- Question 2 - I'm qualified by some as a gas giant. What other planet would fit this description? #speaker:Saturn
    * Venus #speaker:Luna
        That is not correct! You'll find only planets that are neither gaseous nor giant on the other side of the Asteroid Belt. #speaker:Saturn
    * Earth #speaker:Luna
        That is not correct! You'll find only planets that are neither gaseous nor giant on the other side of the Asteroid Belt. #speaker:Saturn
    * Mars #speaker:Luna
        That is not correct! You'll find only planets that are neither gaseous nor giant on the other side of the Asteroid Belt. #speaker:Saturn
    * Jupiter #speaker:Luna
        You are absolutely correct! My homie Jupiter is also a gas giant-- even more so than I! #speaker:Saturn
    
- Question 3 - True or False: There might be life on one of my moons! #speaker:Saturn
    * [I don't know.] I... I'm sorry. I don't know. #speaker:Luna
        That's alright! I'll just count it as wrong, and move on. Question 4 - #speaker:Saturn
        It's alright, Luna! Everyone gets that question wrong. #speaker:Enceladus
        Hmm, that's a good point. Maybe I should write a better question.  Anyway-- #speaker:Saturn
        Actually, why would anyone need to know that? #speaker:Iapetus
        Why would anyone need to know any of this? #speaker:Hyperion
        Um... well... #speaker:Saturn
        -> matter
    * [Why does this matter] Wha-- why does this matter? Why do I have to know every little thing about you before I can orbit you? #speaker:Luna
        ~ satAffinity++
        Please, darling, it's all part of the process. Now, to repeat the question-- #speaker:Saturn
        -> matter
    * [Earth wouldn't tell me.] Oh... Earth would've known this... #speaker:Luna
        Ah, you've met Earth? How are they doing? It's been a while since I've crossed the Belt. #speaker:Saturn
        Wait a minute! That's Earth's moon! #speaker:Rhea
        Earth's moon? What are you doing all the way out here? #speaker:Iapetus
        I... we broke up... I ran away... #speaker:Luna
        Oh my! Well, isn't that an interesting twist! #speaker:Saturn
        You JERK! You didn't even ask where they were from? #speaker:Rhea
        -> main
    
= matter

Wait a minute, they're right! This quiz IS stupid! #speaker:Iapetus

Yeah! If anything, you should be asking questions about THEM! #speaker:Titan

Now now, I just like to know how much my moons have learned about me! #speaker:Saturn

I didn't even get any of the questions right! #speaker:Hyperion

Tell me ONE thing that YOU'VE learned about Luna! #speaker:Rhea

-> main

= main

Well, I... uh... you know... uh... one thing I should... #speaker:Saturn
    * [How could you be so self-centered?] How could you be so self-centered that you don't even care to get to know your moons? How is anyone supposed to love you if you can't love them? #speaker:Luna
    *[(don't say anything)] ... #speaker:Luna
        Saturn, I know you're very proud of yourself, but could you at least make an EFFORT to focus on something that isn't yourself? #speaker:Rhea

- ... y'know what. Quiz is canceled. I'm gonna go reflect on this. #speaker:Saturn

Saturn storms off. leaving you with all of their moons. #speaker: 

I-I'm sorry... I shouldn't have said anything... #speaker:Luna

Hey, it's alright. Saturn needed to hear that. #speaker:Rhea

Trust me, they're nice... but sometimes they only see themselves. #speaker:Hyperion

I know what you mean... #speaker:Luna

How about you take a breather? We'll go talk to Saturn. #speaker:Rhea

-> END

=== SaturnThird ===

Hi again... is this a bad time? #speaker:Luna

Oh, no darling, you're quite alright. #speaker:Saturn

I've been... reflecting, on what was said last time, and I think that you're right. #speaker:Saturn

I may be the coolest planet around, but that doesn't mean I can ignore my crew, y'know? #speaker:Saturn
    * [Thanks for finally realizing that.] Thanks... for saying that. #speaker:Luna
        Hey, it's what I do now. #speaker:Saturn
    * [Showing interest makes you more cool.] I think that showing your crew that you care makes you even more cool... y'know? #speaker:Luna
        ~ satAffinity += 2
        Woah, that's deep. I never thought about it like that, but it makes sense. Thanks, darling. #speaker:Saturn
        Uh, you're welcome? #speaker:Luna
    * Yeah, I know. #speaker:Luna
        ~ satAffinity++
        Right on. #speaker:Saturn

- So listen, I was gonna go around, check in on all my favorite moons... which is all of them, by the way. #speaker:Saturn

And since you're here right now, and you were just DYING to get in on this action, I figured I might as well start with you. #speaker:Saturn

So here's your super secret final quiz question: Tell me about yourself! #speaker:Saturn

Well... actually, I don't really know. I was never really anyone when I was with Earth. #speaker:Luna

Oh, that's right, you were Earth's fling! I knew I knew you from somewhere. What happened between you two, anyway? #speaker:Saturn
    * [I felt invisible to them.] It was like... I was their only moon, and yet they still never acknowledged me. I would block asteroids so that their little creatures wouldn't die, and they never even cared. #speaker:Luna
        ~ satAffinity += 2
        -> invisible
    * [I couldn't stand those humans.] It was like... so you know how Earth has... humans, right? #speaker:Luna
        ~ satAffinity++
        -> humans
    * [I don't want to talk about it.] I... never mind, I don't want to talk about it... #speaker:Luna
        -> talk

= invisible

All they ever did was fuss about what was happening on their surface. It made me feel so unwanted, so... invisible. #speaker:Luna

So I left. #speaker:Luna

And then came here, where all I did was show myself off without even asking how you were... damn. #speaker:Saturn

Well... at least you knew I was there. Even that was nice. #speaker:Luna

Still... that must've been awful. I'm sorry, Luna-- Moon. #speaker:Saturn

It's alright. And for the record, I think I like Luna more. #speaker:Luna

-> main

= humans

Those gross little things that keep throwing junk around? #speaker:Saturn

Yeah, them. I kept trying to tell Earth to get rid of them, that they were dangerous. They never listened-- not even when they landed on my surface. I couldn't take it anymore, and I left. #speaker:Luna

Oof... that can't possible feel good. Are you okay now, at least? #speaker:Saturn

Well, they left pretty much right away. They need Earth's atmosphere to live. #speaker:Luna

Still... that must've been awful. I'm sorry, Luna-- Moon. #speaker:Saturn

It's alright. And for the record, I think I like Luna more. #speaker:Luna

-> main

= talk

Ooooh, I'm sorry, that's the WRONG ANSWER! #speaker:Saturn

... nah, I'm just messing around. You don't have to say anything you don't want to say, darling. #speaker:Saturn

... #speaker:Luna

Well, maybe it'll be funny later. #speaker:Saturn

-> main

= main

You watch as some of the other moons gather around you. #speaker: 

So? Do you think Luna's going to join us? #speaker:Tian

{
    - ringsInsulted:
        
        Hmm... nah. #speaker:Saturn
        
        Wha-?! Why not? #speaker:Luna
        
        Darling, I can't just let you in after what you said about my rings. #speaker:Saturn
        
        Yeah, that was uncalled for. #speaker:Rhea
        
        I-I'm sorry, right? I didn't mean it... #speaker:Luna
        
        I'm sorry too, but I don't want to have someone around who's harshing my vibes. Maybe next time, okay? #speaker:Saturn
        
        ... #speaker:Luna
    
    - else:
    
        Hmm... maybe, I dunno, I might have to do some more reflection. #speaker:Saturn
        
        But no matter what, thanks for making me realize I needed to better myself. It was really cool of you, darling. #speaker:Saturn
        
        You're... welcome? #speaker:Luna
        
        See you around, Luna. #speaker:Saturn
}

-> END

=== SaturnFourth ===

... hey again. You wanted to talk to me? #speaker:Luna

Yeah, I did. I wanted to thank you again for being honest to me when I need it. #speaker:Saturn

And also, I've decided it's totally 100% cool for you to join us in our great journey around the sun. You in? #speaker:Saturn

Saturn... of course I'm in. You mean the world to me. #speaker:Luna

Don't worry, darling. I'll always be here for you. #speaker:Saturn

Hey, what about us? #speaker:Rhea

And you, and everyone. I'm here for all my favorite moons! #speaker:Saturn

... which, of course, is all of them. #speaker:Saturn

And so, Luna joined Saturn and their moons in orbit. Together, everyone was very cool. And Luna was happy. #speaker: 

-> END