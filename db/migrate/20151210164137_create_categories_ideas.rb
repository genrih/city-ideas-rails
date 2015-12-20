class CreateCategoriesIdeas < ActiveRecord::Migration
  def change
    create_table :categories_ideas do |t|
      t.integer :idea_id
      t.integer :category_id
    end
  end
end
