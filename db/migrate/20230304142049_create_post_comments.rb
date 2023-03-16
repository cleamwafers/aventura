class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :user_id, null: false
      t.integer :sanctuary_id, null: false

      t.timestamps
    end
  end
end
