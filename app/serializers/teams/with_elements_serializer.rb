module Teams
  class WithElementsSerializer < ActiveModel::Serializer

    attributes :id, :name

    has_many :elements, serializer: Users::WithVacationsSerializer

  end
end