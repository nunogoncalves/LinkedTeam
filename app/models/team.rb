class Team < ActiveRecord::Base

  has_many :team_elements

  has_many :elements,
           through: :team_elements,
           source:  :user

  has_many :responsibles,
           -> { where team_elements: { responsible: true } },
           through: :team_elements,
           source:  :user

end