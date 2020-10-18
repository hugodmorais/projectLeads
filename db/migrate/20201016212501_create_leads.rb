class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :zip_code
      t.boolean :is_valid, default: false

      t.timestamps
    end
  end
end
