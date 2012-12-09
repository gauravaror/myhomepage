class SuscribersController < ApplicationController

  def index
  end

  def create
    @suscriber =   Suscriber.new(params[:suscriber])
    if @suscriber.save
      redirect_to root_path
    else
      redirect_to contact_path
    end
  end

end
