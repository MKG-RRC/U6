class AdminUser < ApplicationRecord
  # Devise modules already defined here
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # ✅ Allow these attributes to be searchable in ActiveAdmin
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at remember_created_at reset_password_sent_at reset_password_token]
  end

  # ✅ No sensitive associations to whitelist (but must exist)
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
