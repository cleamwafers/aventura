class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

  ## タグの名前を保存するカラム
   t.string :tags_name, null: false
      t.timestamps
    end
  end
end
