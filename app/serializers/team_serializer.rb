class TeamSerializer < ActiveModel::Serializer
    attributes :id, :name, :user_id, :league_id, :num_of_points
    has_many :contracts
    has_many :players
    has_one :league
end