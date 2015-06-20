module Users
  class Base < ActiveModel::Serializer
    attributes :id, :first_name, :last_name
  end
end