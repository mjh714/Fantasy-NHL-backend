class UserCourseSerializer < ActiveModel::Serializer
    attributes :id, :email, :username
    has_many :leagues
    has_many :teams
end