module Vacations
  class IndexSerializer < ActiveModel::Serializer
    attributes :date, :user_name

    def user_name
      object.user.name
    end
  end
end