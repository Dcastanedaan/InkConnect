class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tattoo_artist

  def index
    # @portfolios = @tattoo_artist.portfolios
    @portfolios = Portfolio.includes(:tattoo_artist, images_attachments: :blob, likes: :user).all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @tattoo_artist = @portfolio.tattoo_artist
  end

  def new
    @portfolio = @tattoo_artist.portfolios.new
  end

  def create
    @portfolio = @tattoo_artist.portfolios.new(portfolio_params)

    if @portfolio.save
      redirect_to dashboard_path
    else
      render :new
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
