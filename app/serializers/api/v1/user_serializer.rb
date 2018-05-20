module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :age, :gender,
                 :lat, :long,
                 :inventories

      has_many :inventories
    end
  end
end
