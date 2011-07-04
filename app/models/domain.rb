# == Schema Information
# Schema version: 20110306180438
#
# Table name: domains
#
#  id                 :integer         not null, primary key
#  code               :string(255)
#  long_name          :string(255)
#  image              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Domain < ActiveRecord::Base
	

	has_many :term_domains
	has_many :terms, :through => :term_domains
	
	
	has_attached_file 	:photo,
						:styles => { :medium => "150x150>", :grav => "96x96>" },
						:default_url => '/assets/domains/temple.png',

						:url => "/assets/domains/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/domains/:id/:style/:basename.:extension"
		
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']	
	#validates_attachement_size :photo, :less_than => 5.megabytes
	
	def codewithlongname
		"#{self[:code]} | #{self[:long_name]}"	
	end	
	
	
end
