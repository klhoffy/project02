class Product < ActiveRecord::Base
	belongs_to :cart
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	has_attached_file :image, styles: { small: "100x100", med: "300x300", large: "600x600" },:default_url => '/images/missing.png',
	:url  => ":s3_domain_url",
    :path => "public/images/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]

end
