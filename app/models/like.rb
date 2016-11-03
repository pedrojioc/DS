# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_type  :string
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  include Notificable
  belongs_to :user
  belongs_to :item, polymorphic: true

  def self.see_if_i_like_it (item_type, item_id, user_id)
  	Like.where(item_type:item_type).where(item_id:item_id).where(user_id:user_id)
  end
end
