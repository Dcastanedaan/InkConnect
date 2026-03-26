class TattooArtistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tattoo_artist, only: [:show, :edit, :update]

  def new
    @tattoo_artist = TattooArtist.new
  end

  def create
    @tattoo_artist = current_user.build_tattoo_artist(tattoo_artist_params)

    if @tattoo_artist.save
      current_user.update(role: "tattoo_artist")

      respond_to do |format|
        format.html { redirect_to @tattoo_artist, notice: "Perfil creado correctamente." }
        format.turbo_stream
      end

    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream
      end
    end
  end

  def show
    @tattoo_artist = TattooArtist.find(params[:id])
    @portfolios = @tattoo_artist.portfolios.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @tattoo_artist.update(tattoo_artist_params)

      respond_to do |format|
        format.html { redirect_to @tattoo_artist, notice: "Perfil actualizado." }
        format.turbo_stream
      end

    else
      render :edit
    end
  end

  private

  def set_tattoo_artist
    @tattoo_artist = TattooArtist.find(params[:id])
  end

  def tattoo_artist_params
    params.require(:tattoo_artist).permit(
      :studio_name,
      :bio,
      :location,
      :instagram,
      :website,
      :hourly_rate
    )
  end
end
