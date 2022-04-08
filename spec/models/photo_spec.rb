require 'rails_helper'

RSpec.describe Photo, type: :model do
  it "user_idがあれば登録できる" do
    photo = build(:photo)
    expect(photo).to be_valid
  end

  it "user_idが空欄だと登録できない" do
    photo = build(:photo, user_id: nil)
    expect(photo).not_to be_valid
  end
end
