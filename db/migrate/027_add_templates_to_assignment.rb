migration 27, :add_templates_to_assignment do
  up do
    modify_table :assignments do
      add_column :public_template, String
    end
    modify_table :assignments do
      add_column :private_template, String
    end
  end

  down do
    modify_table :assignments do
      drop_column :public_template
    end
    modify_table :assignments do
      drop_column :private_template
    end
  end
end