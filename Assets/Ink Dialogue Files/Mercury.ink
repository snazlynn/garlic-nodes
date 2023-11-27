INCLUDE globals.ink

VAR interactions = 0
VAR affinity = 0
{ interactions == 0:
    ~ interactions++
    ~ dayInteractions++
    -> MercuryFirst
}

{ interactions == 1:
    ~ interactions++
    ~ dayInteractions++
    -> MercurySecond
}
    

=== MercuryFirst ===
Hello... #speaker:Moon

Earth's moon? ... what are you doing around here? #speaker:Mercury
    * [I'm in search of a new lover.] Um, just... looking around. #speaker:Moon
        -> superstar
    * [Sightseeing.] Um, just... looking around. #speaker:Moon
        -> superstar
    * [Leaving my rat bastard ex-planet.] I wanted some air. #speaker:Moon
        Yeah? You sure? Not looking at any particular star near us? #speaker:Mercury
            ** [what are you talking about] What? #speaker:Moon
            -> main

= superstar
Well, just so you know, if there's a certain superstar around here you've got your eye on, you'd better back off if you don't want any trouble. Alright? #speaker:Mercury
        * [haha ok bet] ... I'm sorry? #speaker:Moon
        * [what are you talking about] What? #speaker:Moon
- -> main

= main
I'm talking about the sun. #speaker:Mercury
    * [Oh yeah, aren't you like super obsessed with them...] Oh. Right. Of course haha. #speaker:Moon
    * [Well in that case there's no chance in hell I'm backing out, man.] Oh... #speaker:Moon
    * [Why would I have my eye on them] Um... yeah. #speaker:Moon
        Ok. #speaker:Mercury
        
- ... #speaker:Mercury
So why are you out here anyway? Aren't you like, attached to Earth? #speaker:Mercury
    * [I'd rather be launched off into the cold embrace of the unending universe than be attached to them.] No. #speaker:Moon
    * [They're not the boss of me.] ... they're not the boss of me.#speaker:Moon
    * [not anymore lmao screw em] Not really. #speaker:Moon

- I mean, every time I've seen you, you've always just been orbiting around them... #speaker:Mercury

... but at least you're not my competition. #speaker:Mercury

And the sun's way out of your league anyways. No offense. But just in case you were thinking about it, you two would be super incompatible. You're like, complete opposites. #speaker:Mercury

I would be a good fit though. I would be a fantastic fit for the sun. #speaker:Mercury
    * [Do you ever shut up about the sun?] Do you ever-- do anything around here? #speaker:Moon
        S-sorry I mean, what do you do around here? #speaker:Moon
        ... #speaker:Mercury
        ... the temperature's pretty hot this close to a star? #speaker:Moon
    * [Yeah right.] Yeah totally haha #speaker:Moon
    * [Well at least they're not Earth.] ... #speaker:Moon
        ... hey man don't look so down about it. It takes a lot to measure up to a star like them. I would know. #speaker:Mercury

- ... you're pretty bad at making conversation, aren't you? #speaker:Mercury

Listen, here's my advice as a planet. You just gotta work out more and build up your confidence like me. It's all in your head, man. Or in your core, I guess. #speaker:Mercury

I mean, forget the sun for a minute, no one's gonna want you as a satellite if you're this... y'know. #speaker:Mercury

You have no presence. You need to have some kind of pull of your own, at least. #speaker:Mercury

Or, maybe since you've already got Earth, it doens't matter that much to you anyway. #speaker:Mercury

Anyways, I've gotta run. My orbit's about to get closer to the sun. Maybe this time they'll respond to me... wish me luck! #speaker:Mercury

-> END

=== MercurySecond ===

VAR smell = false
VAR ex = false

You again? Is there a reason you keep coming back over here? #speaker:Mercury

Doing some sightseeing? Is there air over here different or something? #speaker:Mercury
    * [Yeah, I think I like the air around you better.] Yeah I like how it smells.. here... better...  #speaker:Moon
        ~ smell = true
    * [Better than being near my ex.] Uh... I just like it here better haha #speaker:Moon
        ~ ex = true
    * [bruh i'm just looking around.] I'm just looking around... #speaker:Moon

- ... ha. #speaker:Mercury

I see what's happening here... #speaker:Mercury

.. sorry? #speaker:Moon

... and I see that you're an astronomically massive liar!! #speaker:Mercury

You suddenly start hanging around me #speaker:Mercury
{
    - smell:
    <> because you "like how it smells"? Seriously? You think I'd just believe that? We don't even have noses! There's no air in space!! #speaker:Mercury
    - else:
    {
        - ex:
        <> because you "just like it here"? Please, at least try to come up with a good excuse. #speaker:Mercury
        - else:
            <>, "just looking around"? Yeah, I bet you are you stupid satellite! You're not even a planet! I bet that's what you're after, huh? #speaker:Mercury
    }
}

- I warned you last time, Moon. Do I need to remind you? #speaker:Mercury
    * [... what the hell are you talking about?] ... I'm sorry, I really don't know what you're talking about. #speaker:Moon
        Stop pretending already. You're clearly looking to become a satellite for the sun, it's so obvious! #speaker:Mercury
    * [Dude, if this is about the sun, I'm seriously not interested.] If this is about the sun-- #speaker:Moon
        ~ affinity++
        Of course it's about the sun! I knew it! You want to become their satellite, don't you? Ha! #speaker:Mercury
    * [(i honestly don't even know what to say to this)] ... #speaker:Moon
        You don't want to admit it? It's so obvious, you're trying to become a satellite for the sun! #speaker:Mercury
        
- What, Earth wasn't enough for you? Well, I'll tel you something as the planet closest to the sun, buddy, and it's that there isn't a single universe where you even have half of a chance with them. #speaker:Mercury
    * [You're insane.] ... you're insane. #speaker:Moon
        ~ affinity--
        Insane?? Do I sound insane to you??? #speaker:Mercury
            ** Yeah, kinda. #speaker:Moon
                ~ affinity--
                -> kinda
            ** Why do you even like the sun so much? #speaker:Moon
                -> why_like
    * [Yeah, well, we'll see about that.] ... okay. #speaker:Moon
        ~ affinity--
        You're not even denying it. Classic. #speaker:Mercury
            ** You're insane. #speaker:Moon
                ~ affinity--
                -> insane
            ** Why do you even like the sun so much? #speaker:Moon
                -> why_like
    * ... are you okay?
        Sure, but you won't be after I'm done with you! #speaker:Mercury
            ** You're insane. #speaker:Moon
                ~ affinity--
                -> insane
            ** Why do you even like the sun so much? #speaker:Moon
                -> why_like

= kinda
That's rich coming from you, a wannabe planet who thinks they're good enough to orbit the sun! #speaker:Mercury

... what's so good about the sun? #speaker:Moon

What's GOOD about the SUN? #speaker:Mercury

-> main

= insane
Stop deflecting!! #speaker:Mercury

What's so good about the sun anyway, dude? #speaker:Moon

What's GOOD about the SUN? #speaker:Mercury

-> main

= why_like
... are you crazy? What's there not to like?? #speaker:Mercury

-> main

= main
They're literally the center of our solar system! A massive star, right here, next to us! #speaker:Mercury
    * Okay, and what else? #speaker:Moon
        ... what do you mean what else? #speaker:Mercury
        I mean, is that the only reason you like the sun? Really? #speaker:Moon
    * ... is that it? #speaker:Moon
        ~ affinity--
        "Is that it?" Watch your tone, you're not even a planet! #speaker:Mercury
        ... I'm just saying, is that really the only reason you like the sun? #speaker:Moon
    * There are way larger stars out there... #speaker:Moon
        ~ affinity--
        Man, so what? It's not like they're here! #speaker:Mercury
        ... I'm just saying, is that really the only reason you like the sun? #speaker:Moon
         
- Well, what else could you want from a celestial body? I mean, what made you like Earth? You're their moon and everything. #speaker:Mercury
    * [delusion] I was... just drawn to them. I don't know. #speaker:Moon
        See? You don't even know. And besides, what other reasons would I need to like them? They're just perfect. #speaker:Mercury
    * [I'm not their moon anymore.] ... #speaker:Moon
        See? You don't even know. And besides, what other reasons would I need to like them? They're just perfect. #speaker:Mercury
    * [Aren't there usually other reasons too?] I feel like usually there are other reasons you'd like someone. #speaker:Moon
        ~ affinity++
- * Does the sun even like you back? #speaker:Moon
    ~ affinity++
    ... of course they do! #speaker:Mercury
    I mean, even though they barely ever acknowledge me... the sun is my center of gravity! They're literally all I ever think about! #speaker:Mercury
    Obviously, they'd like me back. Right? #speaker:Mercury
    ... #speaker:Mercury
    ... #speaker:Moon
    ... anyway, it doesn't matter! Stop confusing me! #speaker:Mercury
    -> main2
* What about their personality? #speaker:Moon
    ~ affinity++
    Oh, come on, that's so cliche. It's all about personality and not mass, huh? #speaker:Mercury
    -> personality
* The reasons you gave just seem kind of superficial... #speaker:Moon
    What, are you trying to shame me for why I like the sun? #speaker:Mercury
    What's a good reason to you then, huh? Personality? That's so cliche. #speaker:Mercury
    -> personality

= personality
And in any case, the sun's personality is... #speaker:Mercury
... #speaker:Mercury
...
... it's fine! There's nothing wrong with it! Stop looking at me like that!! #speaker:Mercury
-> main2

= main2
It's okay, Mercury, there are plenty of stars in the universe... #speaker:Moon

Ugh, I've enough of you! Did you come here just to make fun of me or something?? #speaker:Mercury

Leave me alone! Better yet, never come back! #speaker:Mercury

-> END
