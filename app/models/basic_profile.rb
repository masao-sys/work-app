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
  belongs_to :user
end
