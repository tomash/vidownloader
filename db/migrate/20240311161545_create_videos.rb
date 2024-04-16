class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.json :metadata

      t.timestamps
    end
  end
end
