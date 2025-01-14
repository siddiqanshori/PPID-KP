class Pengajuaninformasi < ApplicationRecord
  belongs_to :user
  has_one_attached :dokumenIdentitas
  has_one_attached :dokumenPermohonanInformasi

  validate :validate_file_type_and_size

  attribute :cara_perolehan_informasi, :string

  def self.ransackable_attributes(auth_object = nil)
    ["alamatEmail", "alamatLengkap", "created_at", "id", "jenisPermohonan", "kebutuhan", "namaLenkap", "noEKtp", "noTelepon", "pekerjaan", "tujuan", "cara_perolehan_informasi", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  # Method untuk mengelompokkan data berdasarkan hari tanpa zona waktu
  def self.grouped_by_day_in_jakarta
    all.map { |record| record.updated_at.in_time_zone('Asia/Jakarta').to_date }
       .group_by(&:itself)
       .transform_values(&:count)
  end

  def self.sum_access_count_by_day_in_jakarta
    all.map { |record| record.updated_at.in_time_zone('Asia/Jakarta').to_date }
       .group_by(&:itself)
       .transform_values { |records| records.sum(&:access_count) }
  end

  private

  def validate_file_type_and_size
    if dokumenIdentitas.attached?
      if !dokumenIdentitas.blob.content_type.start_with?('application/pdf')
        errors.add(:dokumenIdentitas, 'harus berupa file PDF')
      elsif dokumenIdentitas.blob.byte_size > 5.megabytes
        errors.add(:dokumenIdentitas, 'ukuran file melebihi 5MB')
      end
    end

    if dokumenPermohonanInformasi.attached?
      if !dokumenPermohonanInformasi.blob.content_type.start_with?('application/pdf')
        errors.add(:dokumenPermohonanInformasi, 'harus berupa file PDF')
      elsif dokumenPermohonanInformasi.blob.byte_size > 5.megabytes
        errors.add(:dokumenPermohonanInformasi, 'ukuran file melebihi 5MB')
      end
    end
  end
end
