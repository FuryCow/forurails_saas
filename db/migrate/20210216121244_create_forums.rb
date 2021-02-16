class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :name
      t.string :sys_name
      t.string :password_digest
      t.integer :owner_id

      t.timestamps
    end

    add_index :forums, :owner_id
  end
end
