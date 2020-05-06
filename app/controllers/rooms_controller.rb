# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :new_room, only: %i[new create]
  before_action :find_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def show; end

  def new; end

  def create
    if @room.update(params.require(:room).permit(:name))
      redirect_to @room
    else
      render :new
    end
  end

  def edit; end

  def update
    if @room.update(params.require(:room).permit(:name))
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private

  def new_room
    @room = Room.new
  end

  def find_room
    @room = Room.find(params[:id])
  end
end
