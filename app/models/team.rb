class Team < ActiveRecord::Base

  has_many :team_members
  has_many :team_managers

  has_many :members,
           through: :team_members,
           source:  :user

  has_many :managers,
           through: :team_managers,
           source:  :user

  scope :managed_by, ->(user) { includes(:managers).where(users: { id: user.id }) }

  def is_member?(user)
    members.include?(user)
  end

  def is_manager?(user)
    managers.include?(user)
  end

end