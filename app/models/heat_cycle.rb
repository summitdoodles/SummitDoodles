# == Schema Information
#
# Table name: heat_cycles
#
#  id         :integer         not null, primary key
#  date       :date
#  dame_id    :integer
#  in_heat    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class HeatCycle < ActiveRecord::Base
	attr_accessible :date,:dame_id,:in_heat

  belongs_to :dame

	validates :date, :presence => true
	validates :dame_id, :presence => true
	validates :in_heat, :presence => true
	validates_inclusion_of :in_heat, :in => %w{Yes No Maybe}


end
