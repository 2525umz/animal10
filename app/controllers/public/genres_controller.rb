class Public::GenresController < ApplicationController
before_action :set_q, only: [:index, :search]
  def show
  end

  def search
  @results = @q.result
  end
  def set_q
    @q = Genre.ransack(params[:q])
  end
    private

  def genre_params
    params.require(:genre).permit(:name,)
  end
end
