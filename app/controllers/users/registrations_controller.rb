class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout "auth"

  # Metode create untuk menangani pendaftaran pengguna
  def create
    super do |resource|
      if resource.persisted? && resource.active_for_authentication?
        flash[:notice] = 'Pendaftaran berhasil! Silakan cek email Anda untuk mengonfirmasi akun.'
        redirect_to some_path # Ganti dengan rute yang sesuai setelah pendaftaran
      elsif resource.errors.any?
        flash.now[:alert] = resource.errors.full_messages.join(", ")
      end
    end
  end

  protected

  # Menambahkan parameter tambahan yang boleh diterima selama pendaftaran
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :username, :nama_lengkap, :ktp, :telepon, :alamat, :pekerjaan])
  end
end
