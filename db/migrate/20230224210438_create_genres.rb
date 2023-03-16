class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
 ## ジャンルを保存するカラム
  t.string :genre_name, null: false
      t.timestamps
    end
  end
end
