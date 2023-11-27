INCLUDE globals.ink

VAR interactions = 0
VAR affinity = 0

VAR ringsInsulted = false

-> SaturnFirst

=== SaturnFirst ===

Um... h-hello? #speaker:Moon

Well, hello there, gorgeous! Name's Saturn. Yours? #speaker:Saturn

Uh... I-I'm Moon... #speaker:Moon

Mmm... nah. Way too generic. That's like if I was named "Planet." #speaker:Saturn

I'm gonna call you "Luna." How's that sound? #speaker:Saturn
    * [I like it.] Ummm... that actually... that's pretty good... #speaker:Moon
        ~ affinity++
        I should hope so. A beautiful face like yours should have a beautiful name to go with it. #speaker:Saturn
    * [I'm not so sure.] I... uh, I don't know... #speaker:Moon
        Ah don't worry, you'll get used to it. #speaker:Saturn
    * [You don't get to pick my name.] You... uh, you don't get... uh... #speaker:Moon
        ~ affinity++
        Awestruck, right? Yeah darling, I've seen it before. Happens all the time. #speaker:Saturn
    
- Now, what brings you down to Saturn Town? #speaker:Saturn
    * [I'm looking for another planet to orbit.] I'm... looking for... something to orbit.... #speaker:Moon
        -> another_planet
    * [I want to be your moon.] I... I want to be... your moon? #speaker:Moon
        Ah, you flatter me, darling! You and everyone else, though! #speaker:Saturn
        You suddenly notice that Saturn is surrounded by moons. #speaker: 
        Hey. #speaker:Titan
        They seem mostly disinterested in you. #speaker: 
        Awesome, right? And it's no wonder why. After all, check THESE out! #speaker:Saturn
        -> main
    * [Just sightseeing.] Oh, just... looking around. #speaker:Moon
        Well, you've found the right place to look around! Check THESE out! #speaker:Saturn
        -> main

= another_planet

Orbit? Darling, I'm the KING of orbits! Check out all the moons I've got orbiting right now! #speaker:Saturn

You suddenly notice that Saturn is surrounded by moons. #speaker: 

Hey. #speaker:Titan

They seem mostly disinterested in you. #speaker: 

Awesome, right? No small feat that is, either. So, you need some advice? #speaker:Saturn
    * [I could use some advice.] Advice would be nice... #speaker:Moon
    * [I need you ;)] More like I... uh... I need... #speaker:Moon
        Oh darling, whatever it is that you need, you need my advice more. #speaker:Saturn
        
- Alright, Rule Number 1 is Confidence. You gotta be able to sell yourself, and you're not gonna do that without sounding confident. #speaker:Saturn

Rule Number 2 is Uniqueness. You gotta make yourself stand out from the pack. Figure out something that makes you unique and sell it. For example, check THESE out! #speaker:Saturn

-> main

= main

Saturn makes a point of showing off their rings, tilting them so Sun's light reflects off them and blinds you. #speaker: 
    * [They're very cool rings.] They're... very cool. #speaker:Moon
        Yeah, I get that a lot. #speaker:Saturn
    * [They're not that cool.] They're... not really that cool. #speaker:Moon
        ~ ringsInsulted = true
        You notice that Saturn's moons, previously uninterested, are now staring at you. Saturn looks appalled. #speaker: 
        WHAT?? H-how could you say that? The most magnificent rings in the solar system, and they're NOT THAT COOL? #speaker:Saturn
        ... whatever. I'll just... pretend you didn't say that, OK? OK. #speaker:Saturn
    
- Anyway, if you're looking to become one of my moons (and you TOTALLy are-- it's sooo obvious) #speaker:Saturn

... then you'll need to take my quiz. #speaker:Saturn

Q-quiz? #speaker:Moon

It's not personal, darling. I just need a vetting process on account of how many moons want to be mine. #speaker:Saturn

Let me just grab my slide deck and... hmm. Rhea, where's my slide deck? #speaker:Saturn

How should I know? I never touched that damn thing. #speaker:Rhea

Hmm. Well, come back later and I'll get you quizzed up in no time flat, darling. #speaker:Saturn

-> END

=== SaturnSecond ===

I'm back... #speaker:Moon

Ah, excellent timing, darling! I found my slide deck, so we can continue with the quiz. Gather round, everyone! #speaker:Saturn

The moons crowd around you while Saturn pulls out a stack of index cards with "Rizz Quiz" printed on the back. #speaker: 

OK! Question 1 - How many planets orbit between Saturn and the sun? Not including myself, of course. #speaker:Saturn
    * 4 #speaker:Moon
        Oh, that's not right! The correct answer was 5! But don't worry, you're not eliminated yet. #speaker:Saturn
    * 5 #speaker:Moon
        5 is correct! Though, let's be real here, that was an easy one. #speaker:Saturn
    * 6 #speaker:Moon
        Oh, that's not right! The correct answer was 5! But don't worry, you're not eliminated yet. #speaker:Saturn
    * 7 #speaker:Moon
        Oh, that's not right! The correct answer was 5! But don't worry, you're not eliminated yet. #speaker:Saturn

- Question 2 - I'm qualified by some as a gas giant. What other planet would fit this description? #speaker:Saturn
    * Venus #speaker:Moon
        That is not correct! You'll find only planets that are neither gaseous nor giant on the other side of the Asteroid Belt. #speaker:Saturn
    * Earth #speaker:Moon
        That is not correct! You'll find only planets that are neither gaseous nor giant on the other side of the Asteroid Belt. #speaker:Saturn
    * Mars #speaker:Moon
        That is not correct! You'll find only planets that are neither gaseous nor giant on the other side of the Asteroid Belt. #speaker:Saturn
    * Jupiter #speaker:Moon
        You are absolutely correct! My homie Jupiter is also a gas giant-- even moreso than I! #speaker:Saturn
    
- Question 3 - True or False: There might be life on one of my moons! #speaker:Saturn
    * [I don't know.] I... I'm sorry. I don't know. #speaker:Moon
        That's alright! I'll just count it as wrong, and move on. Question 4 - #speaker:Saturn
        It's alright, Luna! Everyone gets that question wrong. #speaker:Enceladus
        Hmm, that's a good point. Maybe I should write a better question.  Anyway-- #speaker:Saturn
        Actually, why would anyone need to know that? #speaker:Iapetus
        Why would anyone need to know any of this? #speaker:Hyperion
        Um... well... #speaker:Saturn
        -> matter
    * [Why does this matter] Wha-- why does this matter? Why do I have to know every little thing about you before I can orbit you? #speaker:Moon
        ~ affinity++
        Please, darling, it's all part of the process. Now, to repeat the question-- #speaker:Saturn
        -> matter
    * [Earth wouldn't tell me.] Oh... Earth would've known this... #speaker:Moon
        Ah, you've met Earth? How are they doing? It's been a while since I've crossed the Belt. #speaker:Saturn
        Wait a minute! That's Earth's moon! #speaker:Rhea
        Earth's moon? What are you doing all the way out here? #speaker:Iapetus
        I... we broke up... I ran away... #speaker:Moon
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
    * [How could you be so self-centered?] How could you be so self-centered that you don't even care to get to know your moons? How is anyone supposed to love you if you can't love them? #speaker:Moon
    *[(don't say anything)] ... #speaker:Moon
        Saturn, I know you're very proud of yourself, but could you at least make an EFFORT to focus on something that isn't yourself? #speaker:Rhea

- ... y'know what. Quiz is cancelled. I'm gonna go reflect on this. #speaker:Saturn

Saturn storms off. leaving you with all of their moons. #speaker: 

I-I'm sorry... I shouldn't have said anything... #speaker:Moon

Hey, it's alright. Saturn needed to hear that. #speaker:Rhhea

Trust me, they're nice... but sometimes they only see themselves. #speaker:Hyperion

I know what you mean... #speaker:Moon

How about you take a breather? We'll go talk to Saturn. #speaker:Rhea

-> END