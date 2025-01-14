require 'rails_helper'

RSpec.describe KegiatanController, type: :controller do
  let(:banner_file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'banner.jpg'), 'image/jpeg') }

  describe "GET #index" do
    before do
      @berita_article1 = Artikel.create!(
        jenis: 'Berita',
        judul: 'Sample Berita 1',
        konten: 'Content for Berita 1',
        banner: banner_file
      )
      @berita_article2 = Artikel.create!(
        jenis: 'Berita',
        judul: 'Sample Berita 2',
        konten: 'Content for Berita 2',
        banner: banner_file
      )

      @kegiatan_article1 = Artikel.create!(
        jenis: 'Kegiatan',
        judul: 'Sample Kegiatan 1',
        konten: 'Content for Kegiatan 1',
        banner: banner_file
      )
      @kegiatan_article2 = Artikel.create!(
        jenis: 'Kegiatan',
        judul: 'Sample Kegiatan 2',
        konten: 'Content for Kegiatan 2',
        banner: banner_file
      )
    end

    it "assigns @kegiatan with articles of jenis 'Kegiatan'" do
      get :index
      expect(assigns(:kegiatan)).to match_array([@kegiatan_article1, @kegiatan_article2])
    end

    it "does not include articles with other jenis" do
      get :index
      expect(assigns(:kegiatan)).not_to include(@berita_article1)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
