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
class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :avatar_image

  has_many :management_comments
  has_many :sale_comments
  has_many :production_comments
  has_many :development_comments

  def avatar_image
    if object.avatar_image != 'default-avatar.png'
      rails_blob_path(object.avatar_image) 
    else
      '/assets/default-avatar.png'
    end
  end
end
