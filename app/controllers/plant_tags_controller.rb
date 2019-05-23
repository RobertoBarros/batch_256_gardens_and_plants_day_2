class PlantTagsController < ApplicationController
  before_action :set_plant, only: %i[new create]
  def new
    @plant_tag = PlantTag.new
  end

  def create

    tags = params[:plant_tag][:tag]
    tags.each do |tag|
      @plant_tag = PlantTag.create(tag: Tag.find(tag), plant: @plant)
    end
    redirect_to @plant.garden
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

end
