class CreateCategoriesExpensesJoinTable < ActiveRecord::Migration[7.0]
  create_join_table :categories, :expenses do |t|
    t.index :category_id
    t.index :expense_id
  end
end
