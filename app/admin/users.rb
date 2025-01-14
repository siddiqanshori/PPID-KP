ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :username, :ktp, :nama_lengkap, :telepon, :alamat, :pekerjaan
  actions :all, except: [:edit, :update, :new, :create, :destroy]

  index do
    selectable_column
    column :id
    column :email
    column :ktp
    column :nama_lengkap
    column :telepon
    column :created_at do |user|
      user.created_at.strftime("%A, %d %B %Y %H:%M")  # Menampilkan created_at dengan format yang jelas
    end
    actions
  end
end
