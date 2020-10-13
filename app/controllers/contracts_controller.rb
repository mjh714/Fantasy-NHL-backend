class ContractsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]
    def index
        contracts = Contract.all
        render :json => contracts, each_serializer: ContractSerializer
    end
    
    def show
        contract = Contract.find(params[:id])
        render :json => contract, each_serializer: ContractSerializer
    end
    
    def create
        # byebug
        contract = Contract.create(contract_params)
        render :json => contract, each_serializer: ContractSerializer
    end
    
    def update
        contract = Contract.find(params[:id])
        contract.update(contract_params)
        render :json => contract, each_serializer: ContractSerializer
    end
    
    def delete
        contract = Contract.find(params[:id])
        contract.destroy
        render json: {}
    end
    
    private
    
    def contract_params
        params.require(:contract).permit(:team_id, :player_id)
    end
end
