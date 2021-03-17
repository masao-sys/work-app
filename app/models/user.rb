# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_one :basic_profile, dependent: :destroy
  has_one :custom_profile, dependent: :destroy

  has_many :informations, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reads, dependent: :destroy
  has_many :favorite_informations, through: :bookmarks, source: :information

  has_many :managements, dependent: :destroy
  has_many :management_comments, dependent: :destroy

  has_many :sales, dependent: :destroy
  has_many :sale_comments, dependent: :destroy

  has_many :productions, dependent: :destroy

  delegate :birthday, :bday, :gender, :department, to: :basic_profile, allow_nil: true

  def has_bookmark?(information)
    bookmarks.exists?(information: information.id)
  end

  def has_read?(information)
    reads.exists?(information: information.id)
  end

  def has_information_written?(information)
    informations.exists?(id: information.id)
  end

  def has_management_written?(management)
    managements.exists?(id: management.id)
  end

  def has_management_comment_written?(management_comment)
    management_comments.exists?(id: management_comment.id)
  end

  def has_sale_written?(sale)
    sales.exists?(id: sale.id)
  end

  def has_production_written?(production)
    productions.exists?(id: production.id)
  end

  def display_name
    basic_profile&.name || self.email.split('@').first
  end

  def prepare_basic_profile
    basic_profile || build_basic_profile
  end

  def prepare_custom_profile
    custom_profile || build_custom_profile
  end

  def avatar_image
    if custom_profile&.avatar&.attached?
      custom_profile.avatar
    else
      'default-avatar.png'
    end
  end

  def background_image
    if custom_profile&.background&.attached?
      custom_profile.background
    else
      'l_e_others_500.png'
    end
  end
end
