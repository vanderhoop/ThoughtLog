# == Schema Information
#
# Table name: ideas
#
#  id               :integer          not null, primary key
#  entry_id         :integer
#  idea_text        :text
#  emotional_weight :integer          default(0)
#  category         :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Idea < ActiveRecord::Base
  attr_accessible :entry_id, :idea_text, :emotional_weight, :category
  belongs_to :entry
end
