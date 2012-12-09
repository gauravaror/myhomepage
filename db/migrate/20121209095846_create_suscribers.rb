class CreateSuscribers < ActiveRecord::Migration
  def change
    create_table :suscribers do |t|
      t.string :name
      t.string :emailid
      t.string :whatsup

      t.timestamps
    end
  end
end
