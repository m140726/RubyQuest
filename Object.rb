# Joey De Lorenzo

# Object.rb


class Object
  attr_accessor :obj_name
  attr_accessor :obj_attr
  
  def initialize( objn, obja)
    @obj_name = objn
    @obj_attr = obja
  end 
  
end