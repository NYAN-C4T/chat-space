require 'rails_helper'

describe Message do
  describe '#create' do

    context 'valid' do
      it 'valid w/ all parameters' do
        user = create(:user)
        group = create(:group)
        message = create(:message, user_id: user[:id], group_id: group[:id])
        expect(message).to be_valid
      end
    end

    context 'invalid' do
      it 'invalid w/o body' do
        message = build(:message, body: '')
        message.valid?
        expect(message.errors[:body]).to include("が入力されていません。")
      end
      it 'invalid w/o user_id' do
        message = build(:message, user_id: '')
        message.valid?
        expect(message.errors[:user]).to include("が不正な値です。")
      end
      it 'invalid w/o group_id' do
        message = build(:message, group_id: '')
        message.valid?
        expect(message.errors[:group]).to include("が不正な値です。")
      end
    end

  end
end
