class ManagementCommentSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :content, :display_created_at

  belongs_to :user


  def display_name
    object.user.display_name
  end

  def display_created_at
    I18n.l(self.object.created_at, format: :default)
  end
end
