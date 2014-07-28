class DropSignsTable < ActiveRecord::Migration
  def down
    drop_table :sign
    raise ActiveRecord::IrreversibleMigration
  end
end
