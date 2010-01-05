class CreateUrlInfos < ActiveRecord::Migration
  def self.up
    create_table :url_infos do |t|
      t.string :href
      t.integer :clicks

      t.timestamps
    end
  end

  def self.down
    drop_table :url_infos
  end
end
