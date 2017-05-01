class Vertical < LedPicture

	has_attached_file :image,
	                  styles: { medium: '600x800!'},
	                  # :default_url => "************",
	                  # :storage => :s3,
	                  :bucket => 'grassy-hill-productions-1'
	# :s3_credentials => S3_CREDENTIALS (we set this in an initializer)
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_attached_file :gif,
	                  styles: { medium: '600x800!' },
	                  :bucket => 'grassy-hill-productions-1'

end