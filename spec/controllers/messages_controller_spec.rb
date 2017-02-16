require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it 'assigns the requested message to @messages' do
      user = create(:user)
      group = create(:group)
      message = create(:message, user_id: user.id, group_id: group.id)
      get :index, group_id: group.id
      messages = Message.where(group_id: group.id)
      expect(assigns(:messages)).to eq messages
    end
    it 'assigns the requested message to @message' do
      get :index
      expect(assigns(:message).new_record?).to be true
    end
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
        expect(message.persisted?).to be true
      end
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'when a message has NOT created' do
      it 'NO record has created' do
        message = build(:message)
        expect(message.save).to be false
      end
      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
