# Joey De Lorenzo

# Object.rb


class QuestObject
  attr_accessor :obj_name
  attr_accessor :obj_attr
  
  def initialize( objn, obja)
    $obj_name = objn
    $obj_attr = obja
  #end

  #def sayObject()
    print $obj_name
    print " which is "
    puts $obj_attr
  end
  
end


#this is a test
