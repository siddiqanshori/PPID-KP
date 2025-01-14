ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  # Menonaktifkan beberapa aksi
  actions :all, except: [:edit, :update, :new, :create, :destroy, :show]

  # Menampilkan kolom-kolom yang diperlukan pada index page
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at do |user|
      user.created_at.strftime("%A, %d %B %Y %H:%M")  # Format sesuai dengan keinginan
    end
    actions
  end

  # Menambahkan filter untuk kolom-kolom tertentu
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  # Form untuk menambahkan atau mengedit AdminUser
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
