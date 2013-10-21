class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.references :user, index: true
      t.references :author, index: true

      t.timestamps
    end
  end
end
