class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true

  def dt_format
    created_at.strftime("%Y/%m/%d %X")
  end
end
