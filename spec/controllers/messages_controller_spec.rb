require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'when message has created correctly' do
      it 'creates a valid record' do
        user = create(:user)
        group = create(:group)
        message = create(:message, user_id: user.id, group_id: group.id)
        expect(message).to be_valid
      end
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'when a message has NOT created' do
      it 'NO record has created' do
        message = build(:message)
        message.valid?
        expect(message.errors.full_messages[0]).to include('が不正な値です。')
      end
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
