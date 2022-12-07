class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :friends

end
