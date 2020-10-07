class LeaguesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]
    def index
        leagues = League.all
        render :json => leagues, each_serializer: LeagueSerializer
    end
    
    def show
        league = League.find(params[:id])
        render :json => league, each_serializer: LeagueSerializer
    end
    
    def create
        league = League.create(league_params)
        render :json => league, each_serializer: LeagueSerializer
    end
    
    def update
        league = League.find(params[:id])
        league.update(league_params)
        render :json => league, each_serializer: LeagueSerializer
    end
    
    def delete
        league = League.find(params[:id])
        league.destroy
        render json: {}
    end
    
    private
    
    def league_params
        params.require(:league).permit(:name)
    end
end
