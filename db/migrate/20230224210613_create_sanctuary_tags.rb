class CreateSanctuaryTags < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctuary_tags do |t|

     t.integer :tag_id, null: false
     t.integer :sanctuary_id, null: false

     t.timestamps
    end
  end
end
