# == Schema Information
#
# Table name: developments
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
#  index_developments_on_user_id  (user_id)
#
require 'test_helper'

class DevelopmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
