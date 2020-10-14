class ContractsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show, :find_contract, :destroy]
    def index
        contracts = Contract.all
        render :json => contracts, each_serializer: ContractSerializer
    end
    
    def show
        contract = Contract.find(params[:id])
        render :json => contract, each_serializer: ContractSerializer
    end
    
    def create
        contract = Contract.create(contract_params)
        render :json => contract, each_serializer: ContractSerializer
    end
    
    def update
        contract = Contract.find(params[:id])
        contract.update(contract_params)
        render :json => contract, each_serializer: ContractSerializer
    end

    def find_contract
        # byebug
        contract = Contract.find_by(contract_params)
        render :json => contract, each_serializer: ContractSerializer
    end
    
    def destroy
        contract = Contract.find(params[:id])
        contract.destroy
        render json: {}
    end
    
    private
    
    def contract_params
        params.require(:contract).permit(:team_id, :player_id)
    end
end
