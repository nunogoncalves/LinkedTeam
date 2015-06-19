module Users
  class TeamElementSerializer < ActiveModel::Serializer

    attributes :id, :first_name, :last_name

    has_many :vacations

    def vacations
      []
    end

  end
end