class ManagementCommentSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :avatar_image, :content, :display_created_at

  def display_name
    object.user.display_name
  end

  def avatar_image
    object.user.avatar_image
  end
end
