class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer     :datetime
      t.string      :message
      t.belongs_to  :user
    end
  end
end
