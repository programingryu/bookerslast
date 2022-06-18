class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      # has_one_attached :image

      t.timestamps
    end
  end
end
