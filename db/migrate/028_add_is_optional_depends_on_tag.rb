migration 28, :add_is_optional_depends_on_tag do
  up do
    modify_table :assignments do
      add_column :is_optional_mie, "BOOLEAN"
    end
    modify_table :assignments do
      add_column :is_optional_jt, "BOOLEAN"
    end
    modify_table :assignments do
      add_column :is_optional_jn, "BOOLEAN"
    end
  end

  down do
    modify_table :assignments do
      drop_column :is_optional_mie
    end
    modify_table :assignments do
      drop_column :is_optional_jt
    end
    modify_table :assignments do
      drop_column :is_optional_jn
    end
  end
end