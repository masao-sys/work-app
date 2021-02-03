# == Schema Information
#
# Table name: information
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_information_on_user_id  (user_id)
#
class Information < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end
end
