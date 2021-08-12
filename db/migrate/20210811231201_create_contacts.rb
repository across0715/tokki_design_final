class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :content
      t.string :remote_ip

      t.timestamps
    end
  end
end
