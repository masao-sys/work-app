# == Schema Information
#
# Table name: production_comments
#
#  id            :bigint           not null, primary key
#  content       :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  production_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_production_comments_on_production_id  (production_id)
#  index_production_comments_on_user_id        (user_id)
#
class ProductionComment < ApplicationRecord
  belongs_to :user
  belongs_to :production

  validates :content, presence: true

  def author_name
    user.display_name
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
