class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :name, :profile_pic, :age, :friends, :get_conversations

  has_many :friends, serializer: FriendSerializer
end
