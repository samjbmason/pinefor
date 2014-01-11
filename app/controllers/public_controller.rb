class PublicController < ApplicationController
  def show
    #"2eSHTbKp8hY"
    @list = List.find_by url: params[:id]
  end
end
