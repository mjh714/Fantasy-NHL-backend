class LeagueSerializer < ActiveModel::Serializer
    attributes :id, :name
    has_many :teams
    has_many :users
end