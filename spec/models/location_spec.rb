# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  latitude   :float            default(27.693852455795415)
#  longitude  :float            default(85.31417280435562)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  meeting_id :integer
#  gmaps_zoom :integer          default(19)
#

require 'spec_helper'

describe Location do
  pending "add some examples to (or delete) #{__FILE__}"
end
