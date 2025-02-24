class ApiUrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @url = Url.new(dest: params[:destination])

    if @url.save
      svg_qr = RQRCode::QRCode
        .new(@url.full_code_url)
        .as_svg(
          color: "000",
          shape_rendering: "crispEdges",
          module_size: 11,
          standalone: true,
          use_path: true
        )

      render json: { "code" => @url.code, "url" => @url.full_code_url, "destination" => @url.dest, "qr_code" => svg_qr }, status: 200
    else
      render json: { "error" => "failed to create link; check params and try again" }, status: 422
    end
  end

  def expand
    @url = Url.find_by(code: params[:code])

    if @url
      render json: { "code" => @url.code, "url" => @url.full_code_url, "destination" => @url.dest }, status: 200
    else
      render json: { "error" => "url not found by code" }, status: 404
    end
  end
end
