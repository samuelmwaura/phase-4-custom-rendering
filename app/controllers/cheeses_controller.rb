class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses,only:[:id, :name, :price,:is_best_seller],methods:[:summary]
    #only, except  and methods are types of options passed to fetched data to determine the shape in which the data is received in the frontend.
    #nb: The options are applied for instances of data and thus are instance options. That is why they apply for every record form the db.  
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese #This rides on the fact that when a record specified with the given id doesnt exist, nil is returned and it is a falsy value in rails.
      render json: cheese,only: [:id, :name, :price, :is_best_seller]  #This is a serializer that helps list out only the required attributes.cheese
      #Only is an option that is passed to the internal is_json method that the rails framework uses internally.
      #The except is another serializer and is used to list out the attribute that one intends not to expose to the frontend
      #Only what is specified to be rendered to the frontend is accessible to the frontend clients.
      #This is the serialization process and is meant to define the shape of the Json responses.
    else
      render(json: {error:"cheese not found"}, status: :not_found) #remember render is a method and the json passed is an argument.
      #Our app noe returns a meaning error instead of nil
      #The status not found will produce a 404 response code. Alternatively, the 404 response code can be passed directly.

    end
  end

end
