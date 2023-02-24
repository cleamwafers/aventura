class CreateSanctuaryTags < ActiveRecord::Migration[6.1]
  def change
    create_table :sanctuary_tags do |t|

      t.timestamps
    end
  end
end
