class UrlsController < ApplicationController
  def confirm
    @url = Url.find_by(code: params[:code])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.create!(dest: params[:dest])
    redirect_to "/confirm/#{@url.code}"
  end

  def redirect
    @url = Url.find_by(code: params[:code])
    redirect_to(@url.dest, status: 301, allow_other_host: true) if @url
  end
end
