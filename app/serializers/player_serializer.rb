class PlayerSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :current_team_name, :primary_position_name, :primary_number, :shoots_catches, :birth_date, :nationality, :height, :weight, :image, :multi_wrong
    has_many :contracts
    has_many :team
end