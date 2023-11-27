INCLUDE globals.ink

VAR interactions = 0
VAR affinity = 0

VAR ignored = false

=== NeptuneFirst ===

Uhh, hello there. #speaker:Moon

Oh... hello. #speaker:Neptune

What's your name? I'm, uhh, Moon. #speaker:Moon

... oh, you're still talking to me? I'm Neptune. #speaker:Neptune

Just so you know, I wouldn't associate with me. #speaker:Neptune
    * [Why is that?] Why, is it a problem to be around you? #speaker:Moon
        ~ affinity++
        I... uh, don't think things could get much worse for me. #speaker:Moon
        Just don't, okay? People don't stay by me for long. #speaker:Neptune
        Well, I have no reason to go... #speaker:Moon
        -> reasontoleave
    * [Well, I'm okay being around you.] Why, is it a problem to be around you? #speaker:Moon
        ~ affinity++
        I... uh, don't think things could get much worse for me. #speaker:Moon
        Just don't, okay? People don't stay by me for long. #speaker:Neptune
        Well, I have no reason to go... #speaker:Moon
        -> reasontoleave
    * [Oh... I see.] I uhh... don't know what to say. #speaker:Moon
        -> see
    
= see

Good. Then you can leave me alone. #speaker:Neptune
    * [Could you at least hear me out?] Could you... um... listen to why I'm here? #speaker:Moon
        ~ affinity++
        Then I'll leave... #speaker:Moon
        Fine... I'll listen... just for a bit though. #speaker:Neptune
        -> reasontoleave
    * [Okay... I'll leave you be.] I suppose I can stop bothering you. #speaker:Moon
    ...
    ... why are you still here? #speaker:Neptune
        ** [I just wanted to talk to someone.] Sorry... I just wanted to talk to someone. #speaker:Moon
            ~ affinity++
            You really are something else. #speaker:Neptune
            So... will you hear me out? #speaker:Moon
            Fine. I'll listen... just for a bit though. #speaker:Neptune
            -> reasontoleave
        ** [Sorry... I can go now.] Yeah... I can go now. #speaker:Moon
            -> END
            
= reasontoleave

I recently left my planet. #speaker:Moon

I guess that explains why you're out here. #speaker:Neptune

But how do I know you wouldn't just leave me as well? #speaker:Neptune
    * [Because I have nowhere else.] Because I have no reason to. #speaker:Moon
    * [I'm not sure how to prove that.] I can't really prove otherwise, but... #speaker:Moon

- I really just want to find a new planet to orbit... #speaker:Moon

I want to orbit again. #speaker:Moon

You've got a lot to sort out there. But I'm not really looking for anything right now. #speaker:Neptune
    * [Would it be alright for me to come back later?] Could I uhh, possibly come back later? #speaker:Moon
    * [Ah... well, okay then...] Ah... okay. #speaker:Moon
        Could I uhh, possibly come back later? #speaker:Moon
        
- I mean, I guess. I'm not sure why you would want to though... #speaker:Neptune

Thank you. It was nice talking to you. #speaker:Moon

Yeah... #speaker:Neptune

-> END

=== NeptuneSecond ===

I'm surprised you came back. #speaker:Neptune

I enjoyed our last talk... #speaker:Moon

Earth never listened much, so it was nice. #speaker:Moon

It must be rough, having to leave. #speaker:Neptune
    * [It was for the best.] It was rough, but it had to be done. #speaker:Moon
        ~ ignored = true
        It just wasn't right, being ignored all the time. #speaker:Moon
        Yeah... it's not fair to ignore someone so close. #speaker:Neptune
        Although, if that's the case, you might not want to stay near me... #speaker:Neptune
    * [Leaving was the easy part.] Leaving was easy... #speaker:Moon
        Now I have nowhere to go. #speaker:Moon
        I understand... but maybe not for the reasons you'd expect. #speaker:Neptune
        
- * {ignored} [I can go if you want...] I can go... #speaker:Neptune
    -> wait
* [Can I ask why?] Could... you tell me about it? #speaker:Moon
    I'm not sure... you'll probably just leave like the rings. #speaker:Neptune
    I can go... #speaker:Moon
    -> wait
* [If you don't want to talk about it, that's fine.] You don't have to tell me if you don't want to. #speaker:Moon
    ~ affinity++
    Thank you. Maybe some other time. #speaker:Neptune
    I would... be willing to hear your story though. #speaker:Neptune
    -> main

= wait

Wait--
    * [(Stay)] ... #speaker:Moon
        Thank you... I'm not used to people talking to me. #speaker:Neptune
        Could you tell me about yourself instead? #speaker:Neptune
        -> main
    * [(Leave)] ... #speaker:Moon
        Moon leaves, feeling that Neptune doesn't want them nearby. #speaker: 
        -> END

= main

You'd... be okay with that? #speaker:Moon

Yeah, I am. #speaker:Neptune

Well... the start of it was that I had to leave Earth. #speaker:Moon

I just couldn't be in their orbit anymore. Year after year, only being taken for granted, and never sought after. #speaker:Moon

It got very lonely. #speaker:Moon

... I get why you left. #speaker:Neptune

Can I be upfront with you? #speaker:Neptune

Of course. #speaker:Moon

I'm not sure if you noticed, but I have more than a few moons. #speaker:Neptune

But, we don't exactly talk anymore. #speaker:Neptune

I've done them wrong, and as such, they don't really want to associate with me. #speaker:Neptune

Unlike you, however, they can't leave. A lone orbit is too unstable for such small moons. I fear they would be lost in the great belt forever if they left. #speaker:Neptune

So, despite me having them here, it gets quite lonely. #speaker:Neptune

The point in this being, I am all too similar to Earth... which is why I pushed you away. #speaker:Neptune

And yet, you came back. #speaker:Neptune
    * [You're nothing like Earth.] You aren't like Earth. #speaker:Moon
        -> projects
    * You looked lonely, so I wanted to talk. #speaker:Moon
        But... why me? Surely there were better choices. #speaker:Neptune
        Aren't I just like Earth? #speaker:Neptune
        You aren't like Earth. #speaker:Moon
        -> projects
    
= projects

They were always preocupied with their stupid projects... #speaker:Moon

First it was the oceans, then the dinosaurs... #speaker:Moon

... and then those humans. #speaker:Moon

You become more and more visibly shaken as you talk. #speaker: 

It's okay, Moon. You don't have to explain everything to me. #speaker:Neptune

Thank you... I know that was a lot. #speaker:Moon

I just needed to get my feelings straight. #speaker:Moon

I understand. #speaker:Neptune

Moon, if you ever wanted to talk more, I'm always here, okay? #speaker:Neptune

-> END