class User < ActiveRecord::Base

  has_attached_file :avatar,
                    styles: {
                      large: "500x500>",
                      medium: "300x300>",
                      thumb: "50x50>"
                    },
                    default_url: "/assets/user.jpg"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


  belongs_to :team

  def name
    "#{first_name} #{last_name}"
  end


end
