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
class ManagementComment < ApplicationRecord
  belongs_to :user
  belongs_to :management

  validates :content, presence: true

  def author_name
    user.display_name
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
