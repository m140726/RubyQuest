# @author Joey De Lorenzo
# @author James Browning

# Game.rb
# This holds the instance of a game.

require "Floor"

class Game
        attr_accessor :protagonist
        attr_accessor :progress
        attr_accessor :floor_arr
        #attr_accessor :

        def initialize()
                floor_arr = Array.new
        end

        def buildGame()
                thisFloor = Floor.new(3)
                thisFloor.buildFloor
        end
end
