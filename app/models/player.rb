class Player < ApplicationRecord
    belongs_to :team
    has_many :contracts
    serialize :multi_wrong, Hash

    # def self.stats(id)
    #     player = NHL::Player.find(id)
    #     binding.pry
    # end
end
