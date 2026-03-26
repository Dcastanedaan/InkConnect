class CommentsController < ApplicationController
  before_action :set_portfolio
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = @portfolio.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @portfolio, notice: "Comentario creado." }
      end
    else
      render turbo_stream: turbo_stream.replace(
        "new_comment",
        partial: "comments/form",
        locals: { portfolio: @portfolio, comment: @comment }
      )
    end
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @portfolio, notice: "Comentario actualizado." }
      end
    end
  end

  def destroy
    @comment = @portfolio.comments.find(params[:id])

    unless @comment.user == current_user || current_user.admin?
      redirect_to @portfolio, alert: "No autorizado"
      return
    end

    @comment.destroy

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

  def set_comment
    @comment = @portfolio.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
