class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tattoo_artist

  def index
    if params[:tattoo_artist_id]
      @tattoo_artist = TattooArtist.find(params[:tattoo_artist_id])
      @portfolios = @tattoo_artist.portfolios
    else
      @portfolios = Portfolio.includes(:tattoo_artist, images_attachments: :blob, likes: :user).all
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @tattoo_artist = @portfolio.tattoo_artist
  end

  def new
    @portfolio = @tattoo_artist.portfolios.new
  end

  def create
    # @tattoo_artist = TattooArtist.find(params[:tattoo_artist_id])
    @portfolio = @tattoo_artist.portfolios.new(portfolio_params)

    if @portfolio.save
      # redirect_to dashboard_path
       redirect_to tattoo_artist_portfolio_path(@tattoo_artist, @portfolio), notice: "Portfolio creado correctamente ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_tattoo_artist
    @tattoo_artist = current_user.tattoo_artist
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :description,
      images: []
    )
  end
end
