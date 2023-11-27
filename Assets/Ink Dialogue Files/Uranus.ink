INCLUDE globals.ink

VAR interactions = 0
VAR affinity = 0
VAR loseGame = false

VAR toldUranusJoke = false
VAR toldUranusTroubles = false
VAR toldUranusBreakup = false

VAR triviaNight = false

{ interactions == 0:
    ~ interactions++
    ~ dayInteractions++
    -> UranusFirst
}

{ interactions == 1:
    ~ interactions++
    ~ dayInteractions++
    -> UranusSecond
}

=== UranusFirst ===

Hello... #speaker:Moon

Why hello there! Might you be here to visit Uranus? #speaker:Uranus

You are in luck, because your search ends here. You are speaking to the one and only. #speaker:Uranus
    * [lol ur anus] Wait, Uranus? Like, uh... hehe, like... #speaker:Moon
        ~ toldUranusJoke = true
        ~ affinity--
        -> dontsayit
    * [Yeah, I know you.] Oh yeah, I know you. #speaker:Moon
        Of course you do! I am the pioneer of the tilted look. I am the glimpse of the blue sky that stands out confidently against the dark void of vacuum. #speaker:Uranus
        I'm not like the other planets, not even the other ice giants-- folks would trek for countless astronomical units just to meet me! That is the reason you have come here, is it not? #speaker:Uranus
            ** [Yeah, I wanted to get to know you better.] Um... yeah, I wanted to... chat with you. #speaker:Moon
                -> chat
            ** [That's not exactly it.] Um... yeah, I wanted to... chat with you. #speaker:Moon
                -> chat
            ** [Are you usually this vain] You, uh... so you've got a lot of good stuff going on, huh. #speaker:Moon
                Indeed. I strive to be the best planet that I can become. Thus, I must take inventory of my strengths so that I may nurture them. #speaker:Uranus
                However, I would scorn to allow vanity to befall me. It is a deadly sin that plagues even the most unsuspecting. #speaker:Uranus Therefore, I must not risk even to humor it.
                So enough about me! What might you be interested in conversing about, hmm? Tell me about yourself! #speaker:Uranus
                -> main
        
= dontsayit

DON'T! YOU! SAY IT! Imbecile, I'll have you know I carry the namesake of a deity of the great skies! If you would make it your laughing stock then you may see yourself out! #speaker:Uranus
    * [I'm sorry.] I'm sorry. I am so sorry. #speaker:Moon
        Uranus collects themself for a moment. #speaker: 
        Thank you. That farce is a low-hanging fruit, and a rotten one at that. Many folks innocently pick at it, unknowing of the irritation it causes me. #speaker:Uranus
        Furthermore, I must apologize for the immediate outburst. Might we restart on the right foot? #speaker:Uranus
        Uh, yeah. Sorry again. #speaker:Moon
        Wonderful. Then I am Uranus, the glimpse of the blue sky that stands out against the void of dark space, and the pioneer of the axial tilt. #speaker:Uranus
        Who might you be? #speaker:Uranus
        -> main
    * [ur anus lmao] It's just too funny though. #speaker:Moon
        Begone. #speaker:Uranus
        ~ loseGame = true
        -> END

= chat

Oh, splendid! Conversing with others does bring me such joy. #speaker:Uranus

Might you be interseted in the fluid dynamics of methane and hydrogen under pressure? Or, if that is a bit much, have you any interest in theistic philosophy? #speaker:Uranus
    * [Fluid dynamics, please.] Uh, sure, the first thing. #speaker:Moon
        ~ affinity++
        -> yapping
    * [Philosophy, please.] Uh, sure, the second thing. #speaker:Moon
        ~ affinity++
        -> yapping
    * Huh? #speaker:Moon
        My apologies. Just some impassioned interests escaping. #speaker:Uranus
        So, what shall we discuss, other than advanced subjects? Would you perhaps like to tell me about yourself? #speaker:Uranus
        -> main

= yapping

Of course! Now with the simple foundations... #speaker:Uranus

Uranus blatheres on about some incomprehensible topical jarson. #speaker: 

But, one must never neglect the edge case, despite its perceived insignificance... #speaker:Uranus

It seems a bit as though they are just trying to sound "intellectual." #speaker: 

... but like I demonstrated, it is a simple yes or no question, when you get down to it. #speaker:Uranus

... #speaker:Uranus

... #speaker:Uranus

Hello? Your answer? #speaker:Uranus

Wha? Uh... #speaker:Moon
    *[Yes] Yeah... #speaker:Moon
    *[No] ... no? #speaker:Moon

- Erm, actually, that is not correct. Technically, it is the state of... #speaker:Uranus

Uranus explains why you are wrong in equally as confusing and extraneous detail. #speaker: 

But with that out of the way, my intuition admonishes me that this may have been a bit much to start with. #speaker:Uranus

I thank you for your interest, however. #speaker:Uranus

Thus, shall we continue? #speaker:Uranus

Yes please. #speaker:Moon

So, what shall we discuss, other than advanced subjects? Would you perhaps like to tell me about yourself? #speaker:Uranus

-> main

= main

* [I'm your newest moon ;)] Uh... #speaker:Moon
* [I'm looking for someone to orbit.] I'm, er, I was... you'd know me as Earth's moon... #speaker:Moon
* [I'm Earth's moon.] I'm, er, I was... you'd know me as Earth's moon... #speaker:Moon

- A pleasure to make your acquaintance, Earth's moon. What else brings you to the outskirts of our lovely system-- other than a visit? #speaker:Uranus
    * [To meet you.] Uh, like you said... to meet you... #speaker:Moon
        Oh, how charming! Well, meet me you have. Thus, your quest is surely complete. #speaker:Uranus
        -> main2
    * [Just exploring.] Uh, just... looking around... #speaker:Moon
        -> looking
    * [I'm looking for someone to orbit.] Uh, just... looking around... #speaker:Moon
        -> looking

= looking

A worthy endeavor! Despite the relative lack of light, there is much to see in our part of the system! #speaker:Uranus

You could meet Neptune and Pluto. The pair of them are not terribly accustomed to guests, but they are good folks, deep down. #speaker:Uranus

You could also visit the Kuiper belt. Sadly, Eris is not around as of late, however I do hear that there are some lovely comets about instead! #speaker:Uranus

-> main2

= main2

Hey Uranus? #speaker:Ariel

Ariel, hello! Would you like to meet our visitor? #speaker:Uranus

Actually, I came to say, is there something you may be forgetting about? #speaker:Ariel

My word, you are correct! Please let the other moons know I will arrive shortly. #speaker:Uranus

Apologies, Earth's moon, I must leave. I am late for group trivia night! Thanks for the chat, kind stranger! Ciao! #speaker:Uranus

Uranus departs to be with their moons. #speaker: 

-> END

=== UranusSecond ===

Oh, hello, Earth's moon! It is a pleasure to see you again. #speaker:Uranus

Rarely do I receive the opportunity to converse with others, and even less often the same folks twice! I do have a habit of running my mouth faster than their attention spans. #speaker:Uranus
    * [Are you sure it's not because ur anus] Are you sure it's not because of... #speaker:Moon
        ~ affinity--
        -> anus
    * [So, how was trivia night?] Yeah, nice to talk with you again. #speaker:Moon
        -> trivia
    * [Hold up, you don't even talk to your own moons?] Wait, you mean you... don't talk to your moons? #speaker:Moon
        -> moons

= anus
You know... your... #speaker:Moon

My #speaker:Uranus

Name? #speaker:Uranus

... #speaker:Uranus

Really, Earth's moon, I trusted you were better than this. #speaker:Uranus
{
    - toldUranusJoke:
        It is no funnier the second time, I assure you. #speaker:Uranus
        
        I would ask you hold an ounce of regard for my own state of mind, but it seems you did not understand the request initially. #speaker:Uranus
        
        Thus I now instead ask for you to increase the physical space between us by a significant amount. #speaker:Uranus
        
        Wha..? #speaker:Moon
        
        Allow me to translate: please leave me alone. #speaker:Uranus
        
        Uranus turns away from you. #speaker: 
        
        ~ loseGame = true
    
    - else:
        ~ toldUranusJoke = true
        I would ask you to hold an ounce of regard for my own state of mind. #speaker:Uranus
        
        Sorry. #speaker:Moon
        
        It won't happen again. #speaker:Moon
        
        I forgive you. And thank you. #speaker:Uranus
        
        ... #speaker:Moon
        
        -> trivia
}

= trivia

~ triviaNight = true
So, uh... how was trivia night? #speaker:Moon

It was delightful! Miranda bested us all, as usual. On some themed rounds the rest of us may prevail, but they are the true master. #speaker:Uranus

Ariel also startled us all briefly with their concerningly specific insight into other moons' habits, but refused to elaborate. #speaker:Uranus

Such behavior is not terribly out of line for them. Ever the mysterious one. #speaker:Uranus

Although I wager that you would understand their likenesses by experiencing them for yourself, rather than simply having me declare them to you. #speaker:Uranus

Thus, might you be interested in meeting some of my moons? #speaker:Uranus

I told them all about our lovely conversation from earlier. They seem to esteem you. #speaker:Uranus

-> main

= moons

Of course I do! I care for each one dearly. #speaker:Uranus
    * [Liar.] Why should I believe you? #speaker:Moon
        ~ affinity--
        ... what?! My moons mean everything to me. I... I could not fathom a different reality! #speaker:Uranus
            ** [I lived in that different reality.] Oh, sorry... #speaker:Moon
                It's just hard to imagine when, you know... #speaker:Moon
                I've... lived in that other reality... for as long as I know. #speaker:Moon
                -> troubles
            ** [Sorry.] Sorry... #speaker:Moon
                ... #speaker:Uranus
    * [Oh, I see.] Oh... I misunderstood. Sorry. #speaker:Moon
        All is forgiven. #speaker:Uranus

- I suppose I should clarify my earlier confusing words. I meant that I do not typically converse with others outside my immediate vicinity. Indeed, I keep company with my dear orbiters all the time. #speaker:Uranus
    * [Must feel nice to be in their place.] Oh... must be nice... #speaker:Moon
        -> troubles
    * That's kind of you. #speaker:Moon
        ~ affinity++
        Thank you! We all do our best to care for each other. I may indulge in some rambling and passion for other subjects from time to time, but they are truly the most important to me. #speaker:Uranus
        I would be confident to assert that the same applies of me to them. Truly, they are all so wonderful... #speaker:Uranus
        Oh, but allow me to share this insight-- you would surely observe it objectively for yourself, rather than by me simply declaring it to you! #speaker:Uranus
        Thus, might you be inclined to meet my moons? #speaker:Uranus
        -> main
    
= troubles

~ toldUranusTroubles = true
Am I hearing you correctly, Earth's moon? Oh dear, are you having troubles with your planet? #speaker:Uranus
    * [Yes] Kinda... #speaker:Moon
        Might I offer you advice? The key to a successful relationship is respectful and open communication. #speaker:Uranus
        It may be difficult to initiate and carry such a conversation. However, it will be worth far more to have discussed your worries openly! #speaker:Uranus
                ** [Earth and I aren't going to be discussing anything anymore.] Actually, we... are already... done... #speaker:Moon
                        ~ toldUranusBreakup = true
                        I'm sorry. #speaker:Uranus
                        Would you like to talk about it? #speaker:Uranus
                        ... #speaker:Moon
                        No, it's alright... #speaker:Moon
                        I understand. Know that I am willing to assist you to the best of my ability. If you would wish it. #speaker:Uranus
                        Yeah, thanks... #speaker:Moon
                ** [Thanks for the advice.] Thanks... #speaker:Moon
    * [No] It's nothing... #speaker:Moon
        I understand. Know that I am willing to assist you to the best of my ability. If you would wish it. #speaker:Uranus
        Yeah, thanks... #speaker:Moon

- Of course. Now, what may get us out of this rut? Ah, I know just the thing! Say, I was hoping to introduce my moons to you, now that we all have a morsel of time to spare. They are all so delightful. Would you be interested? #speaker:Uranus

-> main

= main

* {triviaNight} [Would I get to play trivia night?] Would I get to play trivia night? :) #speaker:Moon
    Aha! I would be delighted to include you in our recreation! #speaker:Uranus
    I have no doubt the others would agree. But why not hear it from themselves? Allow me a moment... #speaker:Uranus
* [No way, I'm supposed to be your moon.] ... #speaker:Moon
    Here, just a moment, I shall summon them. #speaker:Uranus
* [Sure!] Sure, let's do it. #speaker:Moon
    Splendid! Allow me but a moment; I shall summon them. #speaker:Uranus
    
- Uranus takes a moment to call over all of their moons. There are more than you initially guessed. #speaker: 

{
    - toldUranusJoke:
        Earth's moon, eh? I'm Oberon. Heard you're a bit of a jokester. #speaker:Oberon
        
        Yeah, sorry... #speaker:Moon
        
        Don't sweat it. When Uranus and I first met? Did the exact same thing. #speaker:Oberon
        
        Really? #speaker:Moon
        
        Yup. Don't tell anyone, but they do find it a little funny, coming from the right somebody. #speaker:Oberon
        
        Just can't make it a habit. ;) #speaker:Oberon
        
        Wow... alright, thanks! #speaker:Moon
}

Pleased to meet you. You can call me Umbriel. #speaker:Ariel

... huh? No, that's me. #speaker:Umbriel

... and that was a plot to get the spacey one to talk. Ariel, at your service. #speaker:Ariel

Greetings. To learn my name, you must prove your worth. #speaker:???

Come now, that's a bit idiosyncratic, Mir- #speaker:Uranus

No, I'll play along. #speaker:Moon

Perfect. Now, a question, straight from the great mental libraries of Venus: #speaker:???

Earth is awfully of their latest pet project, the "humans." Apparently, these tiny, squishy blobs can alter their landscape over time. What is most astounding is that they never live long enough to see the result. #speaker:???

Now, how long does one of these humans last, on average... in Earth days? #speaker:???

Multi-discipline? Unfair, give 'em a new one! #speaker:Ariel
    * [5,000 days] Like 5,000 days? #speaker:Moon
        Incorrect. I applaud your effort, though. #speaker:???
    * [25,000 days] Like 25,000 days? #speaker:Moon
        ~ affinity++
        Correct, and impressive. #speaker:???
    * [Too long] Blegh, those humans? #speaker:Moon
        Feels like a million days. #speaker:Moon
        A valid sentiment. However, an incorrect answer. #speaker:???

- Call me Miranda. I agree-- even with the home advantage, that was a tough one. #speaker:Miranda

Oh, you are already a natural. #speaker:Uranus

But I do fear we may be hoarding your time already. Swear you will join us again for trivia night? #speaker:Uranus

Heh, yeah, of course. #speaker:Moon

Splendid! I will be anticipating your next visit. #speaker:Uranus

{ 
    - toldUranusTroubles:
    {
        - toldUranusBreakup:
            And, Earth's moon? Do remember to reserve a moment to yourself to rest and reflect. #speaker:Uranus
        - else:
            And, Earth's moon? Do keep my advice in mind. I have utmost faith in you! #speaker:Uranus
        
    }
}

Safe travels, and ciao! #speaker:Uranus

-> END