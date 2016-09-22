class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :access_level
      t.string :description

      t.timestamps
    end
  end
end
