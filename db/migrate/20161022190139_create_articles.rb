class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.string :body

      t.timestamps null: false
    end
  end
end
