# == Schema Information
#
# Table name: development_comments
#
#  id             :bigint           not null, primary key
#  content        :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  development_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_development_comments_on_development_id  (development_id)
#  index_development_comments_on_user_id         (user_id)
#
class DevelopmentComment < ApplicationRecord
  belongs_to :user
  belongs_to :development

  validates :content, presence: true

  def author_name
    user.display_name
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
