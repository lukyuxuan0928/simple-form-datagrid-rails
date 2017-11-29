class ProductsGrid
  include Datagrid

  #
  # Scope
  #

  scope do
    Product
  end

  #
  # Filters
  #

  filter(:id, :string, :multiple => ',')
  filter(:name, :string)
  filter(:visible, :xboolean)
  filter(:category, :string)
  filter(:expire_at, :date, :range => true)
  filter(:condition, :dynamic, :header => "Dynamic condition")
  column_names_filter(:header => "Extra Columns", checkboxes: true)


  #
  # Columns
  #

  column(:id, :mandatory => true)
  column(:name, :mandatory => true)
  column(:visible, :mandatory => true) do
    visible? ? "Yes" : "No"
  end
  column(:category, :mandatory => true)
  column(:description)
  column(:expire_at, :mandatory => true) do |record|
    record.expire_at.to_date
  end

  column(:actions, :html => true, :mandatory => true) do |record|
    link_to "Edit", edit_product_path(record), :class => 'btn btn-primary'
  end
end
