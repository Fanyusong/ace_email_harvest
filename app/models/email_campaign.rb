class EmailCampaign < ApplicationRecord
  has_many :messages, class_name: "Ahoy::Message" , :foreign_key => :campaign_id
  belongs_to :user


  mount_uploader :file, EmailFileUploader

  def read_csv
    array = []
    CSV.foreach("#{Rails.public_path}/#{self.file.url}" , headers: false).each_with_index do |row, index|
      next if index == 0
      is_real = EmailValidator.valid?(row[1])
      array << row[1] if is_real
    end
    update(list_email: array)
    array
  end
end
