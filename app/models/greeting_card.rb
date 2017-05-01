class GreetingCard < ActiveRecord::Base

  has_attached_file :front_image, styles: { large: "500x700!", medium: "300x300!", thumb: "100x100!" }
  validates_attachment_content_type :front_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :inside_image, styles: { large: "500x700!", medium: "300x300!", thumb: "100x100!" }
  validates_attachment_content_type :inside_image, content_type: /\Aimage\/.*\Z/

  scope :live, -> { where("discontinued = #{false}") }
  scope :discontinued, -> { where("discontinued = #{true}") }

  def is_discontinued?
    discontinued
  end

end
