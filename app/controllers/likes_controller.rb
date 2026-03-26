class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio
  before_action :authorize_role!

  def create
    @like = @portfolio.likes.find_or_create_by(user: current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @portfolio }
    end
  end

  def destroy
    @like = @portfolio.likes.find_by(user: current_user)
    @like&.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @portfolio }
    end
  end

  private

  def set_portfolio
    @tattoo_artist = TattooArtist.find(params[:tattoo_artist_id])
    @portfolio = @tattoo_artist.portfolios.find(params[:portfolio_id])
  end

  def authorize_role!
    return if current_user.usuario? || current_user.tattoo_artist?
    
    respond_to do |format|
      format.html do
        redirect_to @portfolio, alert: "No tienes permiso para dar like."
      end
      format.turbo_stream { head :forbidden }
    end
  end
end
