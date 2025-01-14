class Dokuman < ApplicationRecord
  after_initialize :set_default_access_count, if: :new_record?

  has_one_attached :attachment

  def self.ransackable_attributes(auth_object = nil)
    ["attachment", "created_at", "id", "instansi", "jenis_dokumen", "jenis_informasi", "jenis_ppid", "judul_dokumen", "updated_at"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["attachment_attachment", "attachment_blob"]
  end

  def set_default_access_count
    self.access_count ||= 0
  end

  # Method untuk mengelompokkan berdasarkan hari di zona waktu Jakarta
  def self.grouped_by_day_in_jakarta
    all.map { |record| record.updated_at.in_time_zone('Asia/Jakarta').to_date }
       .group_by(&:itself)
       .transform_values(&:count)
  end

  # Method untuk menjumlahkan access_count berdasarkan hari di zona waktu Jakarta
  def self.sum_access_count_by_day_in_jakarta
    all.group_by { |record| record.updated_at.in_time_zone('Asia/Jakarta').to_date }
       .transform_values { |records| records.sum { |record| record.access_count.to_i } }
  end
end
