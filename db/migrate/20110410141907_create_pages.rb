class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :cached_slug
      t.text :body
      t.boolean :is_published, :default=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
