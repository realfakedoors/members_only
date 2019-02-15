class ChangePostAuthorToForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :author
    add_foreign_key :posts, :users
  end
end
