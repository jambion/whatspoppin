class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_email
      t.string :comment
      t.integer :rating
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
