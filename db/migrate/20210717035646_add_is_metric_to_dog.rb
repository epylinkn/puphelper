class AddIsMetricToDog < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :is_metric, :bool
  end
end
