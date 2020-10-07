class TeamSerializer < ActiveModel::Serializer
    attributes :name, :user_id, :league_id
    has_many :contracts
    has_many :players
    has_one :league
end