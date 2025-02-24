class UrlsController < ApplicationController
  def confirm
    @url = Url.find_by(code: params[:code])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(dest: params[:dest])
    if @url.save
      redirect_to "/confirm/#{@url.code}"
    else
      @error_msgs = @url.errors.map{|e| "#{e.attribute == :dest ? 'URL' : e.attribute.to_s} #{e.message}" }
      render :new
    end
  end

  def redirect
    @url = Url.find_by(code: params[:code])
    redirect_to(@url.dest, status: LinkConfig::REDIRECT_STATUS_CODE, allow_other_host: true) if @url
  end
end
