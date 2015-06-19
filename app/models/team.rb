class Team < ActiveRecord::Base

  has_many :team_elements
  has_many :team_managers

  has_many :elements,
           through: :team_elements,
           source:  :user

  has_many :managers,
           through: :team_managers,
           source:  :user

end