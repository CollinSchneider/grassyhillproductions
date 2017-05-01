class Horizontal < LedPicture

	has_attached_file :image,
	                  styles: { medium: '800x600!'},
	                  :bucket => 'grassy-hill-productions-1'
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	has_attached_file :gif,
	                  styles: { medium: '800x600!' },
	                  :bucket => 'grassy-hill-productions-1'

end