INCLUDE globals.ink

{ loseGame == true:
    -> UranusLost
}

{ uraInteractions >= currentDay:
    -> UranusLost
}

{ uraInteractions == 0:
    ~ uraInteractions++
    ~ dayInteractions++
    -> UranusFirst
}

{ uraInteractions == 1:
    ~ uraInteractions++
    ~ dayInteractions++
    -> UranusSecond
}

{ uraInteractions == 2:
    ~ uraInteractions++
    ~ dayInteractions++
    -> UranusThird
}

{ uraInteractions == 3:
    -> UranusFourth
}

=== UranusLost ===

Uranus doesn't seem interested in talking to you. #speaker: 

-> END

=== UranusFirst ===

Hello... #speaker:Moon

Why hello there! Might you be here to visit Uranus? #speaker:Uranus

You are in luck, because your search ends here. You are speaking to the one and only. #speaker:Uranus
    * [lol ur anus] Wait, Uranus? Like, uh... hehe, like... #speaker:Moon
        ~ toldUranusJoke = true
        ~ uraAffinity--
        -> dontsayit
    * [Yeah, I know you.] Oh yeah, I know you. #speaker:Moon
        Of course you do! I am the pioneer of the tilted look. I am the glimpse of the blue sky that stands out confidently against the dark void of vacuum. #speaker:Uranus
       -> knowyou
        
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

= knowyou

I'm not like the other planets, not even the other ice giants-- folks would trek for countless astronomical units just to meet me! That is the reason you have come here, is it not? #speaker:Uranus
    * [Yeah, I wanted to get to know you better.] Um... yeah, I wanted to... chat with you. #speaker:Moon
        -> chat
    * [That's not exactly it.] Um... yeah, I wanted to... chat with you. #speaker:Moon
        -> chat
    * [Are you usually this vain] You, uh... so you've got a lot of good stuff going on, huh. #speaker:Moon
        Indeed. I strive to be the best planet that I can become. Thus, I must take inventory of my strengths so that I may nurture them. #speaker:Uranus
        However, I would scorn to allow vanity to befall me. It is a deadly sin that plagues even the most unsuspecting. #speaker:Uranus 
        Therefore, I must not risk even to humor it. #speaker:Uranus 
        So enough about me! What might you be interested in conversing about, hmm? Tell me about yourself! #speaker:Uranus
        -> main

= chat

Oh, splendid! Conversing with others does bring me such joy. #speaker:Uranus

Might you be interested in the fluid dynamics of methane and hydrogen under pressure? Or, if that is a bit much, have you any interest in theistic philosophy? #speaker:Uranus
    * [Fluid dynamics, please.] Uh, sure, the first thing. #speaker:Moon
        ~ uraAffinity++
        -> yapping
    * [Philosophy, please.] Uh, sure, the second thing. #speaker:Moon
        ~ uraAffinity++
        -> yapping
    * Huh? #speaker:Moon
        My apologies. Just some impassioned interests escaping. #speaker:Uranus
        So, what shall we discuss, other than advanced subjects? Would you perhaps like to tell me about yourself? #speaker:Uranus
        -> main

= yapping

Of course! Now with the simple foundations... #speaker:Uranus

Uranus blathers on about some incomprehensible topical jarson. #speaker: 

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
        ~ uraAffinity--
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
        ~ uraAffinity--
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
        ~ uraAffinity++
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
        ~ uraAffinity++
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

=== UranusThird ===

Earth's moon, welcome back! I was greatly anticipating our next encounter. In fact, we all were. #speaker:Uranus

Really? Thanks. I was looking forward to it, too. #speaker:Moon

Of course! Your company is a great pleasure. #speaker:Uranus

Now, have we any ideas for today's chatter... #speaker:Uranus
    * [How about methane?] I dunno. You wanna try and teach me about methane again? #speaker:Moon
        -> methane
    * [I was thinking, you're honestly really kind.] I was thinking, you are honestly just... so kind. #speaker:Moon
        To me... to your moons... to everyone. #speaker:Moon
        You believe in everyone. You are caring to everyone. #speaker:Moon
        By the stars, Earth's moon, that has just... touched me at the core. Thank you, truly. #speaker:Uranus
        It is my belief that one shows their greatest respect when they genuinely care. #speaker:Uranus
        And, I really do not mean to pry, nor offend, but... #speaker:Uranus
        By your conduct... Earth's moon, is that sign of respect something you have been lacking? #speaker:Uranus
        -> illusion_of_choice
    * [Can I talk to you about my previous relationship?] Actually, I was wondering... #speaker:Moon
        Could I... talk about my experience with Earth? #speaker:Moon
        {
            - toldUranusTroubles:
                I wasn't really ready last time, but... #speaker:Moon
        }
        I think I'm a bit more comfortable opening up now. #speaker:Moon
        Please do. I will hear you out through your finale. #speaker:Uranus
        Alright. Well then, to be honest... #speaker:Moon
        -> main

= methane

Bah! You jest! It is an inviting suggestion, but I would keep you here until next year, truly. #speaker:Uranus

Just ask any of my moons about it. I tend to talk their metaphorical ears off. #speaker:Uranus
    * [Well, maybe I wanna stay with you longer than that.] Well, maybe I'm alright with staying here for that long... #speaker:Moon
        ~ uraAffinity++
        -> staylonger
    * [Oh, I'm sure they don't mind.] Heh, I'm sure they don't mind! #speaker:Moon
        I certainly don't. #speaker:Moon
        Well, thank you. This is a good thing, because I enjoy chatting to an extensive degree. #speaker:Uranus
        I've enjoyed our chats too. You may have come off a bit... eccentric at first, but... we all are, in our own way. #speaker:Moon
        And you've been so kind. To me... and your moons, too. #speaker:Moon
        I can tell you really care about them. #speaker:Moon
        One shows their greatest respect when they genuinely care. #speaker:Uranus
        Is that sight something you have been lacking? #speaker:Uranus
        -> illusion_of_choice
    
= staylonger

Or maybe longer. #speaker:Moon

Was that some sort of suggestion, Earth's moon?! #speaker:Uranus

{
    - toldUranusBreakup:
    
        Heh... maybe. Or just wistful thinking. You tell me. #speaker:Moon
        
        Ever since we split... I don't know if I'll ever find my place again. #speaker:Moon
        
        ... my friend, do you perhaps wish to talk through your experience? #speaker:Uranus
        
        -> illusion_of_choice
        
    - else:
        But hold, what might Earth think of this conduct? #speaker:Uranus
        
        Well, about that... #speaker:Moon
            * [We're no longer together.] We... split up a while ago. #speaker:Moon
                Oh dear. Would you like to talk about it? #speaker:Uranus
                -> illusion_of_choice
            * [I have exited this Earth's exosphere.] We... split up a while ago. #speaker:Moon
                Oh dear. Would you like to talk about it? #speaker:Uranus
                -> illusion_of_choice
}

= illusion_of_choice

* [Yes.] ... yeah. #speaker:Moon
* [Definitely.] ... yeah. #speaker:Moon
* [Absolutely.] ... yeah. #speaker:Moon

- -> main

= main

Earth and I really weren't in a great place. #speaker:Moon

Sure, they were agreeable at first. Like, who would orbit an obvious prick? #speaker:Moon

But after a while, they just completely ignored me. They only cared about their little surface projects. #speaker:Moon

Their Cambrian oceans... those dinosaurs... now humans. There's always something more important going on. #speaker:Moon

And to be honest, any further interaction was more like a performance review. #speaker:Moon

"Keep those tides going! Hey, could you shed some light on my dark side?" #speaker:Moon

"What do you mean, you missed the meteorite?! Those were my favorite reptiles!" #speaker:Moon

I was a tool with no say, really. And I got fed up after a while. #speaker:Moon

So... we ended it. #speaker:Moon

My word. I... had no idea the extent to which your sitaution caused you to suffer. I am glad you feel comfortable enough to confide in me. #speaker:Uranus
    * [Yeah, it was pretty bad.] Yeah, it was pretty bad... #speaker:Moon
        -> main2
    * [Yeah, and not to mention those humans.] Yeah. And after those humans just up and landed on me? That was enough. #speaker:Moon
        ~ uraAffinity++
        -> humans
    * [Thank you for hearing me out.] Yeah. I know that was a lot, but... thank you for hearing me out. #speaker:Moon
        -> hearing

= humans

NO WAY! They just... let them land on your surface without permission like that?! #speaker:Ariel

Oh, uh, sorry for interrupting. Just couldn't let that slide. #speaker:Ariel

And for eavesdropping. #speaker:Ariel

I'll uh, see myself out. :) #speaker:Ariel

And we wonder why they know our daily routines to the letter... #speaker:Uranus

Nevertheless, I agree. I can only imagine how violating that must feel. #speaker:Uranus

And on top of all the other transgressions... #speaker:Uranus

Yeah, it was a lot. #speaker:Moon

-> main2

= hearing

It's nice to get to tell someone. #speaker:Moon

Even nicer that you just... kind of always know what to say. To help me feel a little better. #speaker:Moon

Thank you. I may never know what an individual is feeling at all times. Thus I believe it right to treat all others with compassion. #speaker:Uranus

If I speak too quickly or erroneously make an assumption, that is okay. That is what a sincere apology and accountability is for. #speaker:Uranus

I am pleased to hear that my policy affirms itself with you. And it is my sincere hope that your state improves after all you have been through. #speaker:Uranus

Yeah, it was a lot. #speaker:Moon

-> main2

= main2

I'm glad I got out, but... I don't really know what to do now. #speaker:Moon

Despite the uncertainty it may be causing you, it was the correct choice. And in times of uncertainty, it is imperative to think things over carefully. #speaker:Uranus

Consider your most eminent values. Turn to the counsel of individuals you trust for guidance. #speaker:Uranus

And, you are already progressing in one of those steps. Bravo! Although, given my speech patterns, there may not be much value to my counsel. #speaker:Uranus

Don't sell yourself short. You have been a huge help through all of this. #speaker:Moon

I am so glad I can accomplish that for you, Moon. So very glad. #speaker:Uranus

Me too. Thank you so much. Not just for listening. For all your help. For everyone you've done for me. #speaker:Moon

Of course. #speaker:Uranus

When you depart, I request that you take that aforementioned reflection time. #speaker:Uranus

Allow yourself to exist in the uncertainty for a while. Let yourself flow past it with tranquility. #speaker:Uranus

I also request... #speaker:Uranus

... that you return again sometime. #speaker:Uranus

I think I will. Thank you, Uranus. #speaker:Moon

And thank you, Moon. For looking past my quirks. For knowing me for real. #speaker:Uranus

One more time, then... ciao for now! #speaker:Uranus

Ciao! :) #speaker:Moon

-> END

=== UranusFourth ===

Hey, Uranus. #speaker:Moon

Oh, Moon! I am just related at your arrival! Come, tell me how you fare and what is on your mind. #speaker:Uranus

Well... I've been going around, thinking of some... final goodbyes. #speaker:Moon

My lone orbit is getting unstable, so my time for loitering around here is running out. #speaker:Moon

... I see. This... brings me sorrow. Will you ever return? #speaker:Uranus

Well, about that. You know... despite that looming anxiety, I've been trying to think things over. Like you said. #speaker:Moon

And, well... Uranus... #speaker:Moon

Would you allow me to orbit you? #speaker:Moon

OOO! I can vouch! A sweetheart and a total hoot, what's not to love? #speaker:Ariel

Ariel seems to have shown up out of nowhere. #speaker: 

As can I. Moon is both considerate, and a worthy opponent. #speaker:Miranda

Absolutely, I think they'll be right at home here. #speaker:Oberon

The rest of the moons seem to have followed suit. #speaker: 

Oh, Moon, I thought you'd never ask!!! Yes, of course you may! Uncountably infinite times, yes! #speaker:Uranus

Get in here, bud! #speaker:Oberon

The moons crowd around like some sort of hydrostatically equilibrated group hug. #speaker: 

There is one loose end... it would be just silly to continue referring to you simply as Moon. Might there be a name you may have in mind? #speaker:Uranus

I can assist with ideas if you'd like, but be warned-- most of them originate from my favorite fables. #speaker:Uranus

Heh, that's alright, thank you. #speaker:Moon

I think I'll go with... Luna. #speaker:Moon

Then Luna, I swear to you, #speaker:Uranus

by my core, by my atmosphere, by everything in between, #speaker:Uranus

by my great name as Uranus, #speaker:Uranus

I will be your planet. #speaker:Uranus

I will treat you with the respect and care you deserve as an individual. #speaker:Uranus

I will treat you better than the scoundrel Earth who cast you away. #speaker:Uranus

And you will have a place here, for as long as the great universe expands. #speaker:Uranus

I swear it. #speaker:Uranus

Uranus... thank you. #speaker:Luna

You really are my world. #speaker:Luna

-> END