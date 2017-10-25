class AddPaperclipFieldsToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :image_file_name,    :string
    add_column :images, :image_content_type, :string
    add_column :images, :image_file_size,    :integer
    add_column :images, :image_uploaded_at,  :string
  end
end
