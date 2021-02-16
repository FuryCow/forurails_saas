class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :second_name
      t.integer :status
      t.integer :tariff
      t.string :email
      t.string :password_digest
      t.string :roles, array: true, default: []
      t.string :phone

      t.timestamps
    end
  end
end
