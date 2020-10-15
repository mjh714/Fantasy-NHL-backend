class TeamsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]
    def index
        teams = Team.all
        render :json => teams, each_serializer: TeamSerializer
    end
    
    def show
        team = Team.find(params[:id])
        render :json => team, each_serializer: TeamSerializer
    end
    
    def create
        team = Team.create(team_params)
        render :json => team, each_serializer: TeamSerializer
    end
    
    def update
        team = Team.find(params[:id])
        team.update(team_params)
        render :json => team, each_serializer: TeamSerializer
    end
    
    def delete
        team = Team.find(params[:id])
        team.destroy
        render json: {}
    end
    
    private
    
    def team_params
        params.require(:team).permit(:name, :user_id, :league_id, :num_of_points)
    end
end
