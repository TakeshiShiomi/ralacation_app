require 'rails_helper'

RSpec.describe "Homes", type: :request do
  # FactoryBotのテストデータを使ってuserとpostのデータを作成
  let!(:user) { create(:user) }
  let!(:photo) { create(:photo, user_id: user.id) }

  before do
    get root_path
  end

  describe "GET /homes/top" do
    it "リクエストが成功すること" do
      expect(response).to have_http_status(:success)
    end

    it "photosが取得できていること" do
      expect(response.body).to include photo.address.to_s
      expect(response.body).to include photo.caption.to_s
    end
  end
end
