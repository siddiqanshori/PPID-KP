class User < ApplicationRecord
  attr_accessor :name
  has_many :pengajuaninformasis

  # Validasi KTP: harus 16 digit dan unik
  validates :ktp, presence: true, length: { is: 16 }, uniqueness: { message: "sudah terdaftar" }
  
  validates :email, uniqueness: true
  validates :ktp, uniqueness: true


  # Validasi nama lengkap: hanya mengandung huruf dan spasi
  validates :nama_lengkap, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "hanya boleh mengandung huruf dan spasi" }

  # Validasi nomor telepon: panjang 10-13 digit
  validates :telepon, presence: true, length: { minimum: 10, maximum: 13 }

  # # Validasi email: harus memiliki '@' dan ekstensi domain (bebas domain apa saja)
  # validates :email, presence: true, uniqueness: { message: "sudah terdaftar" }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "harus menggunakan format email yang valid dengan '@' dan ekstensi domain" }

  # Validasi pekerjaan: hanya huruf dan spasi
  validates :pekerjaan, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "hanya boleh mengandung huruf dan spasi" }

  # Validasi username: hanya huruf tanpa angka
  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "hanya boleh mengandung huruf tanpa angka" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end

  def self.ransackable_associations(auth_object = nil)
    ["pengajuaninformasis"]
  end
  # Devise modules
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
end
