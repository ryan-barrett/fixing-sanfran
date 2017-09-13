class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      #foreign association keys
      t.belongs_to :user, index: true

      #Schema attributes
      t.string :title
      t.string :description
      t.string :location

      t.timestamps
    end
  end
end
