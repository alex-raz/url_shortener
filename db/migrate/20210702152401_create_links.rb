class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :long_url, null: false
      t.string :token, null: false

      t.timestamps
    end

    add_index :links, :token, unique: true
  end
end
