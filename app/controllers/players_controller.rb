class PlayersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]
    def index
        players = Player.all
        render :json => players, each_serializer: PlayerSerializer
    end
    
    def show
        player = Player.find(params[:id])
        render :json => player, each_serializer: PlayerSerializer
    end
end
