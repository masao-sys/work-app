# == Schema Information
#
# Table name: managements
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
#  index_managements_on_user_id  (user_id)
#
class Management < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  def author_name
    user.display_name
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
