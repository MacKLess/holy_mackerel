class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :product_id, :integer
      t.column :rating, :integer
      t.column :content, :string

      t.timestamps
    end
  end
end
