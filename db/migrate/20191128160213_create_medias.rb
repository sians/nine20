class CreateMedias < ActiveRecord::Migration[5.2]
  def change
    create_table :medias do |t|
      t.string :title
      t.boolean :published
      t.integer :minutes
      t.datetime :date_published
      t.text :blurb
      t.text :content
      t.string :cover_image
      t.references :issue, foreign_key: true
      t.string :video_url
      t.string :audio_url
      t.string :type

      t.timestamps
    end
  end
end
