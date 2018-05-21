class LeaguesController < ApplicationController
  def index
    @leagues = League.where(creator: current_user)
  end

  def show
    @league = League.find_by(uuid: params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(params.require(:league).permit(:name, :description))

    if @league.update(creator: current_user, uuid: SecureRandom.uuid)
      redirect_to root_path
    else
      render 'new'
    end
  end
end
