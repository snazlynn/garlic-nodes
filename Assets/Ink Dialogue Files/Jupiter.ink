INCLUDE globals.ink

VAR interactions = 0
VAR affinity = 0

{ interactions == 0:
    ~ interactions++
    ~ dayInteractions++
    -> JupiterFirst
}

{ interactions == 1:
    ~ interactions++
    ~ dayInteractions++
    -> JupiterSecond
}

=== JupiterFirst ===

Umm... hi, Jupiter. #speaker:Moon

Hey. Have we met? #speaker:Jupiter
    * [No, but you probably know Earth.] You probably know Earth more than me... #speaker:Moon
        Ah, right. Earth's only moon. I remember you now. #speaker:Jupiter
        -> main
    * [I'm new to this solar system.] I'm... new... #speaker:Moon
        -> new
    * [I'm one of your moons.] I'm... new... #speaker:Moon
        -> new
    
= new

Oh? We don't get many visitors. Though, I'm not surprised you found your way to me. #speaker:Jupiter

Jupiiiiie! You're not gonna bring in another moon, are you?
    * [(don't say anything)] ... #speaker:Moon
    * [Well, about that...] Umm... well, actually... #speaker:Moon

- Oh no you don't! Jupiter's got enough moons to make them happy, thank you very much! #speaker:Europa

Wait a minute! That's Earth's moon! #speaker:Ganymede

-> main

= main

What are you doing so far from Earth? You lost or something? #speaker:Jupiter
    * [I broke up with Earth.] I'm uhh... looking for a new planet. #speaker:Moon
        -> main2
    * [I got lost exploring the Asteroid Belt.] Yeah, I'm lost... #speaker:Moon
        -> lost
    * [Yeah, lost in your gravity.] Yeah, I'm lost... #speaker:Moon
        -> lost
    
= lost

Shouldn't you be with Earth though? How'd you get split from them? #speaker:Callisto
    * [I broke up with them.] We broke up... #speaker:Moon
        -> main
    * [We decided to split up.] We broke up... #speaker:Moon
        -> main

= main2

Well, we can't help you there, hun. Jupiter's so good to us! #speaker:Ganymede

Ooh! Jupie! Show them your spot! #speaker:Io

Jupiter flexes and shows off their Great Red Spot. The surrounding moons swoon. #speaker: 

Wow! So amazing! Isn't it amazing? #speaker:Io
    * [It looks really nice.] I think it looks really nice on you. #speaker:Moon
        ~ affinity += 2
        Thanks... uh, that's just how I roll. #speaker:Jupiter
        Ah, so tough! Jupiter really has it all! #speaker:Callisto
        Except room for more moons, so back off! #speaker:Europa
    * [Does it hurt at all?] Does it hurt? #speaker:Moon
        ~ affinity++
        Nah. I don't feel a thing. #speaker:Jupiter
        Ah, so tough! Jupiter really has it all! #speaker:Callisto
        Except room for more moons, so back off! #speaker:Europa
    * [Storms aren't really my thing.] ... I'm not super into storms. #speaker:Moon
        Oh yeah, Earth's probably pretty stormy as well... sorry. #speaker:Jupiter
        Ah, forget about Earth! That prick has nothing on our Jupiter! #speaker:Callisto
        But our Jupiter has enough moons already, so back off! #speaker:Europa
    
- Hey, how about you back off? It's not like they even notice you! #speaker:Ganymede

How about you BOTH back off! I'm their favorite-- right Jupie? #speaker:Io

... you should probably leave. This can get ugly fast... #speaker:Jupiter

-> END

=== JupiterSecond ===

Hey Jupiter... #speaker:Moon

Oh, hey Moon. Wasn't sure if you would come back. #speaker:Jupiter

Well, I liked talking to you earlier, and... #speaker:Moon
    * [I want to get to know you better.] ... uh, I wanted to get to know you better. #speaker:Moon
        ~ affinity += 2
        Me? Well, I'm the largest and oldest planet around here. I wanted to be a start at one point, but that didn't work out. #speaker:Jupiter
            ** [How does that work?] You can just... be a star? #speaker:Moon
                It's pretty complicated, but you need a lot of mass to start fusion reactions. I was big, but not dense enough. #speaker:Jupiter
                And you should've seen then 4 billion years ago! #speaker:Ganymede
                -> main
            ** [What do you do now?] So... what do you do now? #speaker:Moon
                Not much, really. I guess I chill with Saturn and watch the Asteroid Belt. #speaker:Jupiter
                Not much? What about all those big rocks you hurl around? #speaker:Ganymede
                -> main
    * [I want to talk to some of your other moons.] ... uh, I wanted to chat with... your other moons? #speaker:Moon
        What? Uh, yeah, sure... Io? #speaker:Jupiter
        You wanted to talk to me, Jupie? #speaker:Io
        Actually, Moon wanted to talk to you. #speaker:Jupiter
        Hey, I wanna talk to Moon too! What's up? #speaker:Ganymede
            ** [How do you feel about Jupiter as a planet?] Um, I guess... how's Jupiter? #speaker:Moon
                ... you know, I am still here... #speaker:Jupiter
                Jupiter's great! They may not always tell us, but they love each and every one of us. #speaker:Ganymede
                I've never felt safer than with Jupiter at my barycenter. #speaker:Callisto
                -> main
            ** [Do you always fight over Jupiter like that?] So are you... um... do you always... #speaker:Moon
                -> fight
    * [I just wanted to hang out with you.] ... uh, I want to just, hang out? #speaker:Moon
        ~ affinity++
        Yeah, sure thing. You can chill with me. #speaker:Jupiter
        Waaaait a minute. I know what THAT means. You're trying to fall into my orbit again! #speaker:Callisto
        YOUR orbit? Who thinks YOU get to take over the orbit? #speaker:Ganymede
        Oh, not again... #speaker:Jupiter
            ** [Do you always fight over Jupiter like that?] So are you... um... do you always... #speaker:Moon
                -> fight
            ** [(don't say anything)] ... #speaker:Moon
                Could you not fight right now? We have a guest, after all. #speaker:Jupiter
                -> fight
    
= fight

What? Oh hun, I'm so sorry! You must think we hate each other! #speaker:Ganymede

We do. #speaker:Europa

... OK, Europa hates everyone. But the rest of us... I don't know. #speaker:Ganymede

I think we just riled up sometimes. Orbiting such a strong planet can do that to a moon. #speaker:Callisto

-> main

= main

Toughest in the solar system! That's our Jupie! #speaker:Io

Yeah, that's me... #speaker:Jupiter

Is something wrong? #speaker:Moon

Hm? Oh, it's nothing. Nothing you need to worry about, at least. #speaker:Jupiter
    * [It's ok to expresss your emotions.] ... y'know, you don't always have to be tough. It's ok to express your emotions sometimes. #speaker:Moon
        ~ affinity += 2
    * [I'm here for you.] Okay... well, if you need anything, I'm here for you. #speaker:Moon
        ~ affinity++

- That's really nice of you to say... #speaker:Jupiter

You suddenly notice that Jupiter is starting to cry. They try to hide it, but you can hear them choking back sobs. #speaker: 

AH! What did you do to them? #speaker:Europa

I-I don't know what happened! We were just talking, and-- and... #speaker:Moon

Jupie? What's wrong? Are you alright? #speaker:Io

I'm so sorry... I should leave... #speaker:Moon

-> END