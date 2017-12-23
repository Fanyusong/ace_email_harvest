class EmailCampaign < ApplicationRecord
  has_many :messages, class_name: "Ahoy::Message"
  belongs_to :user


  mount_uploader :file, EmailFileUploader

  def read_csv
    array = []
    CSV.foreach("/Users/phamngoctung/Documents/Workspace/ace_email_harvest/public/upload/email_campaign/1/test/Workbook2.csv" , headers: false).each_with_index do |row, index|
      next if index == 0
      array << row[1]
    end
    update(list_email: array)
    array
  end
end
