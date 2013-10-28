# @author Joey De Lorenzo
# @author Trey Browning

class Door  
  def buildObject(n)  
  		@nextRoom = n
  end 
  
  def open()
  		if(@nextRoom.class.name == "Room")
      	@nextRoom.enter()
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
      	nextFloor = @nextRoom.shift
      	nextFloor.buildFloor(@nextRoom)
      	nextFloor.start()
      else
      	puts "You have reached the end."
      end
  end
end
