class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :survivor, foreign_key: true
      t.integer :survivor_id_report
      t.timestamps
    end
  end
end
