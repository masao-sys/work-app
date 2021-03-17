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
require 'test_helper'

class SaleCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
