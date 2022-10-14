class BandsController < ApplicationController
  before_action :set_band, only: %i[ show update destroy ]

  # GET /bands
  def index
    @bands = Band.all

    # render json: @bands, adapter: :json, each_serializer: BandSerializer
    # render json: {:band => BandSerializer.new(@band).to_h}
    # render json: @bands, each_serializer: BandSerializer
    json_string = BandSerializer.new(@bands).serializable_hash
    render json: json_string
  end

  # GET /bands/1
  def show
    # render json: @band
    json_string = BandSerializer.new(@band)
    render json: json_string.serializable_hash
  end

  # POST /bands
  def create
    @band = Band.new(band_params)

    if @band.save
      render json: @band, status: :created, location: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bands/1
  def update
    if @band.update(band_params)
      render json: @band
    else
      render json: @band.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bands/1
  def destroy
    @band.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:name)
    end
end
