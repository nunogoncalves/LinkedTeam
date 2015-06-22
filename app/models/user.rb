class User < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  belongs_to :team

  has_many :vacations

  has_attached_file :avatar,
                    styles: {
                      large: "500x500>",
                      medium: "300x300>",
                      thumb: "50x50>"
                    },
                    default_url: "/assets/user.jpg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def name
    "#{first_name} #{last_name}"
  end

end
