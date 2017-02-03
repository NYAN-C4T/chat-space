class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true

  def self.dt_format(dt)
    dt.strftime("%Y/%m/%d %X")
  end
end
