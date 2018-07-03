class LeaguesController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def index
    @leagues = current_user.leagues.includes(:creator)
  end

  def show
    @league = League.find_by_uuid params[:id]
    @report = LeagueReport.new(@league)

    if !current_user
      render 'leagues/summary', layout: 'unauthenticated'
    elsif !policy(@league).show?
      render 'leagues/summary'
    end
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(params.require(:league).permit(:name, :description))

    ActiveRecord::Base.transaction do
      if @league.update(creator: current_user)
        LeagueParticipation.create(league: @league, user: current_user)
        redirect_to league_path @league.uuid
      else
        render 'new'
      end
    end
  end

  def edit
    @league = League.find_by_uuid params[:id]
    authorize @league
    @participations = @league.participations.includes(:user)
  end

  def destroy
    @league = League.find_by_uuid params[:id]
    authorize @league
    if @league.destroy
      flash[:success] = I18n.t('leagues.actions.updated')
      redirect_to leagues_path
    end
  end

  def update
    @league = League.find params[:id]
    authorize @league

    if @league.update(params.require(:league).permit(:name, :description))
      flash[:success] = I18n.t('leagues.actions.updated')
      redirect_to edit_league_path @league.uuid
    else
      flash[:error] = I18n.t('leagues.actions.not_updated')
      @participations = @league.participations.includes(:user)
      render 'edit'
    end
  end
end
