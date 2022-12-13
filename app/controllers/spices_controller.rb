class SpicesController < ApplicationController

def index
    spice = Spice.all 
    render json: spice, status: :ok
end
  
def create
    new_spice = Spice.create(spice_params)
    render json: new_spice, status: :created
end

def update
    spice = Spice.find_by(id: params[:id])
    if 
        spice.update(spice_params)
        render json: spice, staus: :accepted
    else
       render json: {error: "spice not found"}, status: :not_found
    end
end

def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
        spice.destroy
        head :no_content
    else
       render json: {error: "spice not found"}, status: :not_found
    end
end

private

def spice_params
params.permit(:title, :image, :notes, :description, :rating)
end  

end