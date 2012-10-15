class Server < ActiveRecord::Base
	attr_accessible :hostname, :title

	has_many :watches, :dependent => :destroy

	accepts_nested_attributes_for :watches, :allow_destroy => true

	def to_s
		self.title
	end
end
