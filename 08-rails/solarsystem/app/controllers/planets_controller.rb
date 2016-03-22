class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find params[:id]
  end

  def new
  end

  def create
    planet = Planet.create planet_params
    redirect_to planet_path(planet.id)
  end

  private
  def planet_params
    # Safe whitelist of the specific params we're permitting
    params.permit :name, :image, :orbit, :diameter, :mass, :moons
  end
end
