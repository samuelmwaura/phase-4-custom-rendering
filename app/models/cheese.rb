class Cheese < ApplicationRecord
  
  def summary
    "#{name}: $#{price}" #The name and price will be returned without the self keyword since they are defined as instance methods
    #This method can be included in the return Json inorder to extend the Json data that is returned.
    #Since it is an instance method it will be called for every instance that is being returned.
  end

end
