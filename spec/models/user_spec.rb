require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、emailアドレス、パスワードがあれば登録できる" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "名前が空欄だと登録できない" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors.full_messages).to eq ["Nameを入力してください"]
  end

  it "emailアドレスが空欄だと登録できない" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors.full_messages).to eq ["Eメールを入力してください"]
  end

  it "パスワードが空欄だと登録できない" do
    user = build(:user, password: nil, password_confirmation: nil)
    user.valid?
    expect(user.errors.full_messages).to eq ["パスワードを入力してください"]
  end

  it "パスワードが6文字以上であれば登録できる" do
    password = Faker::Internet.password(min_length: 6)
    user = build(:user, password: password, password_confirmation: password)
    expect(user).to be_valid
  end

  it "パスワードが5文字以下だと登録できない" do
    password = Faker::Internet.password(min_length: 1, max_length: 5)
    user = build(:user, password: password, password_confirmation: password)
    user.valid?
    expect(user.errors.full_messages).to eq ["パスワードは6文字以上で入力してください"]
  end

  it "パスワードと確認が一致していないと登録できない" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors.full_messages).to eq ["パスワード（確認用）とパスワードの入力が一致しません"]
  end

  it "登録済みのemailアドレスでは登録できない" do
    email = Faker::Internet.email
    user = create(:user, email: email)
    expect(user).to be_valid
    user2 = build(:user, email: email)
    user2.valid?
    expect(user2.errors.full_messages).to eq ["Eメールはすでに存在します"]
  end
end
