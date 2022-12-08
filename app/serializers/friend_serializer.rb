class FriendSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :age, :profile_pic
end
