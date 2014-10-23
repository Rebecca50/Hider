class RemoveBlogIt < ActiveRecord::Migration
  def change
    drop_table :blogit_posts
    drop_table :blogit_comments

  end
end
