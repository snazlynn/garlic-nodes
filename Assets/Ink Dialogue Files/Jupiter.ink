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

{ interactions == 2:
    ~ interactions++
    ~ dayInteractions++
    -> JupiterThird
}

{ interactions == 3:
    -> JupiterFourth
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
    * [It's ok to express your emotions.] ... y'know, you don't always have to be tough. It's ok to express your emotions sometimes. #speaker:Moon
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

=== JupiterThird ===

H-hi again. #speaker:Moon

Oh... hey, Moon. #speaker:Jupiter

I'm sorry about last time. #speaker:Moon

Oh, you don't have to apologize. #speaker:Jupiter

Oh, Moon! I wasn't sure if you would be back. #speaker:Ganymede

Yeah, you seemed even more shaken up than Jupie. #speaker:Io

Hey, guys, could you give us a bit of space? I want to talk to Moon for a bit. #speaker:Jupiter

Oh, yeah, sure thing! #speaker:Callisto

We'll be just within earshot if you need us! #speaker:Europa

The moons retreat just far enough away so that they can still eavesdrop on your conversation. #speaker: 
    * [What happened last time?] So... what happened last time? #speaker:Moon
    * Are you alright? #speaker:Moon
        ~ affinity++
        Yeah, I'm feeling better. Thanks for asking. #speaker:Jupiter
    * [(wait for Jupiter to say something)] ... #speaker:Moon
        You're probably wondering what... that... was all about. Well... #speaker:Jupiter

- Last time you were here, you made me realize that I had been pushing back my feelings for a long time. I wanted to look tough for my moons because that was what they liked about me. #speaker:Jupiter

But I guess that wasn't really what I liked about myself. I mean, sometimes it was alright, but... it's a lot of pressure sometimes. #speaker:Jupiter

And the constant fighting doesn't help either. #speaker:Jupiter

Yeah, that sounds awful. Unfortunately, I can relate to that. #speaker:Moon

Oh, that's right, you split with Earth. If you don't mind talking about it, what happened between you two? #speaker:Jupiter
    *[(explain what happened with Earth)] A lot, over a long time. They were nice at first, but gradually, I felt ignored. They were always so self-centered, too busy with whatever was going on on their surface. #speaker:Moon
        -> talk
    * I'd rather not talk about it. #speaker:Moon
        That's alright. I understand. #speaker:Jupiter
        -> silent
        
= talk

I would get in the way of asteroids for them, and they never seemed to even notice. The one time they did was when I let one slip, and they got really mad and started yelling at me about all the dinosaurs I killed. #speaker:Moon

And that might have been okay, but I could never get past those humans. I'd told Earth over and over to get rid of those humans before they got dangerous, but they just didn't listen-- even when some of those humans landed on my surface. #speaker:Moon

Wait, the humans left Earth? Since when could they do that? #speaker:Jupiter

Pretty recently. It's fine, I don't have any. They can't survive for long without Earth. #speaker:Moon

But yeah, after that... I guess it finally hit me that Earth just didn't care about me. So I left. #speaker:Moon

Wow, that sounds terrible. No wonder you're looking for someone else to orbit. #speaker:Jupiter
    * Thank you for being so kind to me. #speaker:Moon
        ~ affinity++
        I should be thanking you. You were kind to me first. #speaker:Jupiter
        ... and you're welcome. #speaker:Jupiter
        -> silent
    * [May I orbit you?] May... may I orbit you? #speaker:Moon
        I was wondering when you would ask that... #speaker:Jupiter
        Oh no you don't! #speaker:Europa
        You watch as Europa races towards you and Jupiter. The other moons follow. #speaker: 
        You better not bring them in without talking with us! #speaker:Ganymede
        Especially now that I have to check them for humans! #speaker:Europa
        Looks like there's going to be a group discussion first. I'll let you know a bit later, okay? #speaker:Jupiter
        -> main
    * [(don't say anything)] ... #speaker:Moon
        -> silent

= silent

For a moment, neither of you say anything. The silence is nice, a period of tranquility without the sound of 96 moons all fighting for attention. #speaker: 

Eventually, the other moons return. #speaker: 

Alright hun, our turn for the private conversation. #speaker:Ganymede

We've got to talk with Jupie about getting you in our circle! #speaker:Io

And about getting you checked for humans. You better not have any! #speaker:Europa

Moon, I know you're still looking for an orbit. I'll talk with the others and get back to you, okay? #speaker:Jupiter

-> main

= main

Yeah, sure thing. #speaker:Moon

Thanks for hanging out. It was really nice. #speaker:Jupiter

-> END

=== JupiterFourth ===

Hi... you wanted to talk to me again? #speaker:Moon

Well, I had a chat with the other moons, and... we'd like you to join us. #speaker:Jupiter

Hun, you're an absolute delight. You deserve someone way better than Earth. #speaker:Ganymede

Someone like Jupie! Kind AND Strong! #speaker:Io

Wow... thank you so much... #speaker:Moon

I would love to join you in orbit. #speaker:Moon

Yay! We're glad to have you around! #speaker:Callisto

As long as you don't get in my way. And you don't bring humans here. And-- #speaker:Europa

Moon, I promise to treat you better than Earth ever could. You'll never feel alone with us. #speaker:Jupiter

Hey, wait a minute. We can't just call you Moon! We're ALL moons! #speaker:Callisto

Oh, you're right! I never had a name with Earth... hmm... #speaker:Moon

... call me Luna. #speaker:Moon

Luna... that's a lovely name. #speaker:Jupiter

And so, Luna joined Jupiter in their orbit. And though the moons still frequently bickered, Jupiter was much happier. And Luna was loved. #speaker: 

Oh, Jupiter... you mean the world to me. #speaker:Luna

-> END