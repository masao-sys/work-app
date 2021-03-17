# == Schema Information
#
# Table name: sale_comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sale_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_sale_comments_on_sale_id  (sale_id)
#  index_sale_comments_on_user_id  (user_id)
#
class SaleCommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :display_name, :display_created_at

  belongs_to :user

  def display_name
    object.user.display_name
  end

  def display_created_at
    I18n.l(self.object.created_at, format: :default)
  end
end
