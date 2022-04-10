require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) { FactoryBot.create(:relationship) }

  describe '#create' do
    context "保存できる場合" do
      it "全てのパラメーターが揃っていれば保存できる" do
        expect(relationship).to be_valid
      end
    end

    context "一意性の検証" do
      before do
        @relation = FactoryBot.create(:relationship)
        @user1 = FactoryBot.build(:relationship)
      end

      it "following_idが同じでもfollower_idが違うなら保存できる" do
        relation2 = FactoryBot.build(:relationship, following_id: @relation.following_id,
                                                    follower_id: @user1.follower_id)
        expect(relation2).to be_valid
      end

      it "following_idが違うならfollower_idが同じでも保存できる" do
        relation2 = FactoryBot.build(:relationship, following_id: @user1.following_id,
                                                    follower_id: @relation.follower_id)
        expect(relation2).to be_valid
      end
    end
  end

  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "仮想モデルfollowingとのアソシエーション" do
      let(:target) { :following }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end

    context "仮想モデルfollowerとのアソシエーション" do
      let(:target) { :follower }

      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'User' }
    end
  end
end
