# config/initializers/ransack_active_storage.rb

Rails.application.config.to_prepare do
  # Allow Ransack to query ActiveStorage attachment columns
  ActiveStorage::Attachment.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[id name record_type record_id blob_id created_at]
    end

    def self.ransackable_associations(auth_object = nil)
      %w[blob]
    end
  end

  # Allow Ransack to query ActiveStorage blob columns
  ActiveStorage::Blob.class_eval do
    def self.ransackable_attributes(auth_object = nil)
      %w[id key filename content_type metadata service_name byte_size checksum created_at]
    end

    def self.ransackable_associations(auth_object = nil)
      %w[attachments]
    end
  end
end
