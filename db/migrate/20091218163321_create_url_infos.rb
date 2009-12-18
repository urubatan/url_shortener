class CreateUrlInfos < ActiveRecord::Migration
  def self.up
    create_table :url_infos do |t|
      t.string :href
      t.int :clicks

      t.timestamps
    end
  end

  def self.down
    drop_table :url_infos
  end
end
