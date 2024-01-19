INCLUDE globals.ink

{ currentDay == 1:
    -> day_one_end
}

{ currentDay == 2:
    -> day_two_end
}

{ currentDay == 3:
    -> day_three_end
}

{ currentDay == 4:
    -> solo_ending
}

===day_one_end===
Ever since I left Earth, my orbit's felt a little weird... #speaker:Moon

I should be careful who I choose to talk to for the next few days... my time is running out. #speaker:Moon

I need to find a new planet soon. #speaker:Moon

~ dayInteractions = 0
~ currentDay++

-> END

===day_two_end===
My orbit's getting even worse. I don't think I have much time left. #speaker:Moon

~ dayInteractions = 0
~ currentDay++

-> END

===day_three_end===
... #speaker:Moon

I can't hold on for much longer. I probably only have time for one more conversation. #speaker:Moon

Who should I talk to? #speaker:Moon
    * {merAffinity >= 5} Mercury.
        ~ picked = "Mercury"
    * {marAffinity >= 4} Mars.
        ~ picked = "Mars"
    * {jupAffinity >= 4} Jupiter.
        ~ picked = "Jupiter"
    * {satAffinity >= 3} Saturn.
        ~ picked = "Saturn"
    * {uraAffinity >= 3} Uranus.
        ~ picked = "Uranus"
    * No one.
         ~ picked = "NonePicked"

-

~ dayInteractions = 0
~ currentDay++

-> END

=== solo_ending ===

I don't think is solar system is meant for me, after all. #speaker:Moon

Maybe leaving is a good thing. I don't need to hold onto a planet just because that's what's expected of a moon. #speaker:Moon

Well, I can decide that later. And in the meantime, there's an entire universe for me to explore. #speaker:Moon.

-> END