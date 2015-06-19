class Team < ActiveRecord::Base

  has_many :team_elements

  has_many :elements,
           through: :team_elements,
           source:  :user

  has_many :managers,
           -> { where team_elements: { manager: true } },
           through: :team_elements,
           source:  :user

end