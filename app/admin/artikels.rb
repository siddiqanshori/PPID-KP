ActiveAdmin.register Artikel do
  permit_params :jenis, :judul, :banner, :konten
  config.filters = false

  scope :all, default: true
  scope "Kegiatan" do |scope|
    scope.where(jenis: "Kegiatan")
  end
  scope "Berita" do |scope|
    scope.where(jenis: "Berita")
  end

  form do |f|
    f.inputs "Artikel Details" do
      f.input :jenis, as: :select, collection: ["Berita", "Kegiatan"]
      f.input :judul
      f.input :banner, as: :file
      f.input :konten, as: :quill_editor
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :jenis
    column :judul
    column :created_at do |artikel|
      artikel.created_at.strftime("%A, %d %B %Y %H:%M")  # Menampilkan tanggal dalam format yang diinginkan
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :jenis
      row :banner do |artikel|
        image_tag url_for(artikel.banner), style: "width: 50%;" if artikel.banner.attached?
      end
      row :judul
      row :konten do |artikel|
        artikel.konten.body.to_s.html_safe
      end
      row :created_at do |artikel|
        artikel.created_at.strftime("%A, %d %B %Y %H:%M")  # Menampilkan tanggal dalam format yang diinginkan
      end
    end
  end
end
