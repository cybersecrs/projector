class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string   :naziv
      t.text     :opis
      t.decimal  :ukupno,  null:false, default: 0
      t.decimal  :do_sada, null:false, default: 0
      t.boolean  :aktivan, null:false, default: true

      t.timestamps
    end
  end
end
