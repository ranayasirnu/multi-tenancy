class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :access_level
      t.string :description

      t.timestamps
    end
  end
end
