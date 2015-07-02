migration 29, :add_manual_block do
  up do
    modify_table :corrections do
      add_column :is_blocking, "BOOLEAN"
    end
  end

  down do
    modify_table :corrections do
      drop_column :is_blocking
    end
  end
end