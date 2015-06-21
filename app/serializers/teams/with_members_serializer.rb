module Teams
  class WithMembersSerializer < ActiveModel::Serializer

    attributes :id, :name

    has_many :members, serializer: Users::WithVacationsSerializer

  end
end