class CreateDilemma < ActiveRecord::Migration[5.0]
  def change
    create_table :dilemmas do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
