# James Browning - 140726
# Joey DeLorenzo - 141560
#
# Ruby Phase 2
#
# 

require "Room"
require "QuestObject"


width = `/usr/bin/env tput cols`.to_i
height = `/usr/bin/env tput lines`.to_i




puts `clear`


$fixedWidth = false
if width < 60 or height < 24
  puts "Please scale larger!"
  $fixedWidth = true
end

while width < 60 or height < 24
  width = `/usr/bin/env tput cols`.to_i 
  height = `/usr/bin/env tput lines`.to_i
end


puts "\n"

puts "O-----------------------------------------------O".center(width)
puts "| (                         )                   |".center(width)
puts "| )\\ )             (     ( /(       ____________|".center(width)
puts "|(()/(      (    ( )\\    )\\())     / /        \\ \\".center(width)
puts " | /(_))     )\\   )((_)  ((_)\\     /_/__________\\_\\".center(width)
puts " |(_))    _ ((_) ((_)_  __ ((_)    \\ \\          / /".center(width)
puts "|| _ \\  | | | |  | _ ) \\ \\ / /     \\ \\        / /".center(width)
puts "||   /  | |_| |  | _ \\  \\ V /       \\ \\      / /|".center(width)
puts "||_|_\\   \\___/   |___/   |_|         \\ \\    / / |".center(width)
puts "|                                     \\ \\  / /  |".center(width)
puts "|                            (         \\ \\/ /   |".center(width)
puts "|        (                   )\\ )    *  \\  /    |".center(width)
puts "|      ( )\\       (    (    (()/(  ` )   \\/     |".center(width)
puts "|      )((_)      )\\   )\\    /(_))  ( )(_       |".center(width)
puts "|     ((_)_    _ ((_) ((_)  (_))   (_(_())      |".center(width)
puts "|      / _ \\  | | | | | __| / __|  |_   _|      |".center(width)
puts "|     | (_) | | |_| | | _|  \\__ \\    | |        |".center(width)
puts "|      \\__\\_\\  \\___/  |___| |___/    |_|        |".center(width)
puts "O-----------------------------------------------O".center(width)

if $fixedWidth
  puts "\n"
  puts "Thank you for scaling your terminal!".center(width)
  puts "AND NOW........".center(width)
end
puts "\nWelcome to Ruby Quest v0.2\n\n"

puts "Press 'ENTER' to continue...."

gets #wait for user input

puts `clear`


puts "Welcome to the first room, you enter, look around and you see:"
room1 = Room.new
room1.buildRoom
puts "What would you like to do?"
puts " "
puts " "
puts " "
puts "Well, that's the game, press 'ENTER' to end..."
gets

#puts room1.object_one
#puts room1.object_two
#puts room1.object_three

#puts Map
# name test 2
