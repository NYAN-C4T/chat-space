class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    drop_table :messages
    create_table :messages do |t|
      t.text       :body
      t.string     :image
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
