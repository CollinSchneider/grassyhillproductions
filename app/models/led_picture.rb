class LedPicture < ActiveRecord::Base

  validates :code, presence: true
  validates :title, presence: true
  validates :type, presence: true

  scope :live, -> { where("discontinued = #{false}") }
  scope :discontinued, -> { where("discontinued = #{true}") }

end

class Horizontal < LedPicture
  has_attached_file :image,
                    styles: { medium: '800x600!'},
                    :bucket => 'grassy-hill-productions-1'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :gif,
                    styles: { medium: '800x600!' },
                    :bucket => 'grassy-hill-productions-1'
end

class Vertical < LedPicture
  has_attached_file :image,
                    styles: { medium: '600x800!'},
                    :bucket => 'grassy-hill-productions-1'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :gif,
                    styles: { medium: '600x800!' },
                    :bucket => 'grassy-hill-productions-1'
end

class Square < LedPicture
  has_attached_file :image,
                    styles: { medium: '600x600!'},
                    :bucket => 'grassy-hill-productions-1'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :gif,
                    styles: { medium: '600x600!' },
                    :bucket => 'grassy-hill-productions-1'
end

class NewStyle < LedPicture
  has_attached_file :image,
                    styles: { medium: '850x475!'},
                    :bucket => 'grassy-hill-productions-1'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :gif,
                    styles: { medium: '850x475!' },
                    :bucket => 'grassy-hill-productions-1'
end