class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # Si el usuario es tatuador cargamos su perfil
    if current_user.tattoo_artist?
      @tattoo_artist = current_user.tattoo_artist

      # cargamos portfolios del tatuador
      @portfolios = @tattoo_artist.portfolios.order(created_at: :desc)
    end
  end
end
