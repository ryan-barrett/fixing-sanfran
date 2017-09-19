class AddTypeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :issue_type, :string
  end
end
