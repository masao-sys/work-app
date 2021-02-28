class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :avatar_image

  has_many :management_comments

  def avatar_image
    rails_blob_path(object.avatar_image) if object.avatar_image.attached?
  end
end
