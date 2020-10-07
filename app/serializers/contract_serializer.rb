class ContractSerializer < ActiveModel::Serializer
    attributes :id, :team_id, :player_id
    has_one :team
    has_one :player
end