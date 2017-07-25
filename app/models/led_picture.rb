class LedPicture < ActiveRecord::Base

  has_attached_file :image,
    styles: { medium: "850x475!"},
    # :default_url => "************",
    # :storage => :s3,
    :bucket => 'grassy-hill-productions-1'
    # :s3_credentials => S3_CREDENTIALS (we set this in an initializer)
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :gif,
    styles: { medium: "850x475!" },
    :bucket => 'grassy-hill-productions-1'

  def self.upload_files_job
    already_created = []
    Dir.foreach("#{Rails.root}/leds") do |dir|
      next if dir == '.' || dir == '..'
      files = Dir["#{Rails.root}/leds/#{dir}/*"]
      dir_names = dir.split('..')
      code = dir_names[0]
      title = dir_names[1]
      led_exists = LedPicture.find_by(code: code)
      if led_exists
        already_created << "#{code} already exists, cannot add. "
      else
        puts "Adding #{title}....."
        led = LedPicture.create(code: code, title: title)
        files.each do |file|
          if file.include?('gif')
            led.gif = File.open(file, 'r')
          else
            led.image = File.open(file, 'r')
          end
        end
        led.save!
      end
    end
    return already_created.join(',') if already_created.any?
    return 'Upload Successful!'
  end

end
