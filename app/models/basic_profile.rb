# == Schema Information
#
# Table name: basic_profiles
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  department :integer
#  gender     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_basic_profiles_on_user_id  (user_id)
#
class BasicProfile < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }
  enum department: { management: 0, sales: 1, production: 2, development:3 }
  belongs_to :user

  def bday
    return '未入力' unless birthday.present?
    birthday.strftime("%Y年%m月%d日")
  end

  def author_name
    user.display_name
  end
end
