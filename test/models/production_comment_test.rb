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
require 'test_helper'

class ProductionCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
