class CreateSanctuaries < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctuaries do |t|

      t.timestamps
    end
  end
end
