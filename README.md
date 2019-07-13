# invokerTrainer
Practice playing Dota 2's Invoker in assembly language!

Invoker is considered one of the most challenging heroes in Dota 2. Most heroes have four spells to learn and cast. Invoker has 14 unique spells and each can only be accessed by casting a specific combination of three quas ('q'), wex ('w'), or exort ('e') followed by casting invoke ('r'). For example, the spell Sun Strike can only be cast when three exorts are selected followed by casting invoked.

Proper timing is essential in MOBAs such as Dota 2. A well timed spell can change the course of the game and a delayed reaction can easily result in defeat. It is therefore crucial to recall each of Invoker's spells quickly and accurately.

Intended to run in [MARS](http://courses.missouristate.edu/KenVollmar/mars/) MIPS Simulator.

## Installation
Download and run [MARS](http://courses.missouristate.edu/KenVollmar/mars/) MIPS Simulator.
Open invokerTrainer.asm, assemble, and run.

## Gameplay
A random spell is chosen and the name is printed to the screen. The player then attempts to enter the correct combination of quas, wex, and exort. Only three reagents may be selected at any time and after three are selected, the next replaces the earliest selected reagent so that only three remain. The player then invokes the spell by pressing 'r'. If the combination was correct, the time to invoke the spell is displayed and a new spell to invoke is randomly selected. If the combination was incorrect, a new spell to invoke is chosen randomly. The player can press 'x' at any time to quit.

## For the future
It is unlikely I will continue to work on this project. However, there are a few ways it could be improved.
### Gameplay changes
* Only accept 'q', 'w', 'e' (reagents), 'r' (invoke), or 'x' (quit)
* Hide the most recent key entered so only the currently selected reagents.
* Record the average time to invoke each spell and all spells.
* Implement a GUI
### Better Assembly practice
* Store the currently selected reagents in save registers instaed of temporary registers.

