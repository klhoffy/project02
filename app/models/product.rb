class Product < ActiveRecord::Base
	
	has_many :order_items
	has_attached_file :image, styles: { small: "100x100", med: "300x300", large: "600x600" },:default_url => '/images/missing.png'
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	default_scope { where(active: true) }
end
