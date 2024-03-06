class ImagesController < ApplicationController
  def show
    filename = params[:filename]
    send_file Rails.root.join('app', 'assets', 'images', filename), type: 'image/png', disposition: 'inline'
  end
end
