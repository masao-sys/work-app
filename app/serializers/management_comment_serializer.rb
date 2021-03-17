# == Schema Information
#
# Table name: management_comments
#
#  id            :bigint           not null, primary key
#  content       :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  management_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_management_comments_on_management_id  (management_id)
#  index_management_comments_on_user_id        (user_id)
#
class ManagementCommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :display_name, :display_created_at

  belongs_to :user

  def display_name
    object.user.display_name
  end

  def display_created_at
    I18n.l(self.object.created_at, format: :default)
  end
end
