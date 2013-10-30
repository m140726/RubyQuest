# Joey De Lorenzo
# James Browning

# Room.rb


# This class handles rooms in our adventure text game
# Rooms are randomly generated-- this means that the contents
# within the room are never the same.

require "QuestObject"
require "Door"
require "NPC"

class Room
   attr_accessor :objs_arr
   @num_objs
   @lastRoom
   @door
   @player
   @hasNPC
   @NPC

   # Decide if there will be an NPC in this room or not, and create 
   # x QuestObjects in the room.
   def initialize(x)
      @hasNPC = [true, false].choice
      @num_objs = x
      @objs_arr = Array.new(x) { QuestObject.new }
   end

   # Put the door in here, and link the room we just came from, and 
   # the next one to this Room. Also build our QuestObjects.
   def buildRoom(l, n)
      i = 0

      @lastRoom = l
      @door = Door.new
      @door.buildObject(n)    

      if @hasNPC
         @NPC = NPC.new("Bad Guy", 1)
      end

      for obj in @objs_arr
         obj.buildObject
      end
   end

   # Enter this room.
   def enter(p)
      @player = p
      puts `clear`
      puts "You enter a room.\n\n"
      menu()
   end

   # The basic Room menu. It lets you go to the next room, but only if
   # there is no NPC present, blocking the path.
   def menu()
      puts "What would you like to do?"
      puts "\t1. Look around.\n"
      puts "\t2. Check inventory.\n"
      puts "\t3. Pick up object.\n"
      puts "\t4. Open door to next room.\n"
      if @hasNPC == true
         puts "\t5. Interact with %s.\n" % @NPC.getName()
      end

      system("stty raw -echo")
      @answer = STDIN.getc
      system("stty -raw echo")

      if @answer.chr == '1'
         lookAround()
         userIn()
         menu()
      elsif @answer.chr == '2'
         @player.checkItems()
         userIn()
         menu()

      elsif @answer.chr == '3'
         if @num_objs.to_i == 0
            puts "\nThere is nothing interesting in this room."
         else
            puts "\nPick up which object?"
            o = 1
            for obj in @objs_arr
               printf("\t" + o.to_s + ". ")
               obj.inspect()
               o = o + 1
            end
            system("stty raw -echo")
            @answer = STDIN.getc
            system("stty -raw echo")

            @answer = @answer.chr.to_i - 1

            if @answer <= @objs_arr.size - 1
               printf("\nYou have picked up ")
               @objs_arr[@answer].inspect()
               @player.pickUp(@objs_arr[@answer])
               @objs_arr.delete_at(@answer)
            else
               puts "Invalid number"
            end
         end
         userIn()
         menu()

      elsif @answer.chr == '4'
         if @hasNPC == false
            puts "\nYou approach the door, and rest your hand on the rough surface."
            userIn()
            @door.open(@player)
         else
            puts "\n%s is blocking the door!" % @NPC.getName()
            userIn()
         end
         
      elsif @answer.chr == '5'
         interact()
         userIn()
         menu()
      end
   end

   #This prints out PRESS ANY KEY and waits for input from user
   def userIn()
      printf("\n[PRESS ANY KEY] ")
      system("stty raw -echo")
      @answer = STDIN.getc
      system("stty -raw echo")
      puts `clear`
   end

   # This interacts with the NPC. Right now you just fight.
   def interact()
      puts "You begin to fight %s!\n\n" % @NPC.getName()

      while @NPC.isAlive()
         puts "What would you like to do?"
         puts "\t1. Attack %s.\n\n" % @NPC.getName()

         system("stty raw -echo")
         @answer = STDIN.getc
         system("stty -raw echo")

         if @answer.chr == '1'
            puts `clear`
            damage = @player.attack()
            if damage > 0
               puts "You attack %s for %s!\n" % [@NPC.getName(), damage.to_s]
               @NPC.takeHit(damage)
               if @NPC.getHealth() < 1
                  puts "You have killed %s!\n\n" % @NPC.getName()
                  @hasNPC = false
                  break
               end
               puts "%s's health drops to %s!\n\n" % [@NPC.getName(), @NPC.getHealth().to_s]
            else
               puts "You missed!"
            end
         end

         badDamage = @NPC.attack()
         if badDamage > 0
            puts "%s attacks you for %s!\n" % [@NPC.getName(), badDamage.to_s]
            @player.takeHit(badDamage)
            if @player.getHealth() < 1
               puts "You have died! Game over.\n\n"
               abort()
            end
            puts "Your health drops to %s!\n\n" % @player.getHealth().to_s
         else
            puts "%s missed!" % @NPC.getName()
         end
      end
   end

   # Inspect all of the QuestObjects in the Room.
   def lookAround()
      i = 0

      printf("\nYou look around the room. Upon closer inspection, you notice")

      if @objs_arr.size == 0
         puts "\nthat there is nothing interesting in this room."
      else
         puts ":\n\n"
         for obj in @objs_arr
         obj.inspect()
         end
      end
   end
end
