class Vacation < ActiveRecord::Base

  STATES = %w(accepted rejected to_review)

  belongs_to :user

end