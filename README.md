# Simple_Form & Datagrid

## Simple_Form

Simple Form aims to be as flexible as possible while helping you with powerful components to create your forms.

## Datagrid

Ruby library that helps you to build and represent table-like data with:

  - Customizable filtering
  - Columns
  - Sort order
  - Localization
  - Export to CSV

## Getting Started

Here I'm using a simple application to apply the features of Simple_Form & Datagrid on rails.

## Installation

Before build up the application, we need to do some installation

### Simple_Form

Before using the simple_form authentication features, you need to add it in GemFile:
```
    gem 'simple_form'
```

Then, you need to install the simple_form with bootstrap:
```
    $ rails generate simple_form:install --bootstrap
```

### Example

Some of the example that showing how to use the features of simple_form.

```
    <%= simple_form_for(@product) do |f| %>
      <%= f.error_notification %>
      <div class="card" style="margin:20px; border-color:#333">
        <div class="card-header" style="background-color:#333;color:#fff; border-color:#333">
          Info
        </div>

        <div class="card-block" style="padding:20px">
          <div class="row">
            <div class="col-md-6">
              <div class="card" style="border-color:#333">
                <div class="card-header" style="background-color:#fff; border-color:#333">
                  Primary
                </div>

                <div class="card-block" style="padding:20px">
                  <div class="form-inputs">
                    <%= f.input :name, required: true, placeholder: "Write your product name" %>
                    <%= f.input :category, collection: ['Cloth', 'Food', 'Electronic']%>
                    <%= f.input :price, class: "form-control" %>
                    <%= f.input :stock, label: 'Stock quantity', input_html: { value: '10'}%>
                    <%= f.input :visible, inline_label: 'Visible' %>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="card" style="border-color:#333">
                <div class="card-header" style="background-color:#fff; border-color:#333">
                  Optional
                </div>

                <div class="card-block" style="padding:20px">
                  <div class="form-inputs">
                    <%= f.input :description, hint: "Be short" %>
                    <%= f.input :color, collection: ['red', 'green', 'white', 'black'] %>
                    <%= f.input :expire_at %>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      <div class="form-actions" style="text-align:right; margin:5px">
        <%= f.button :submit, :class => 'btn btn-primary' %>
      </div>
    <% end %>

```

### Datagrid

Before using the features of datagrid, we need to install the gem,(kaminari for paginate):

```
    gem "datagrid", :git => "https://github.com/bogdan/datagrid.git"
    gem "kaminari"
```

### Example

Some of the example that using datagrid:

Create a folder named 'grids' in 'app', create a file named 'products_grid.rb'.

```
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
        link_to "Edit", edit_product_path(record)
      end
    end

```

In the controller:

```
    @products_grid = ProductsGrid.new(params[:products_grid]) do |scope|
      scope.page(params[:page])
    end
```

In the view:

```
    <div>
      <div class="form">
        <%= datagrid_form_for @products_grid, url: products_path %>
      </div>


      <div class='total'>
        Total: <%= @products_grid.assets.total_count %>
      </div>
      <div class='table'>
        <%= datagrid_table(@products_grid) %>
        <%= paginate @products_grid.assets %>
      </div>

    </div>
```

## Version

Please take note that might minor changes of syntax on different version

```
    ruby              ==   2.4.1
    rails             ==   5.1.4
    rvm               ==   1.29.3
    curl              ==   7.47
    nodejs            ==   4.2.6
    clearance         ==   1.15.1
    jquery-rails      ==   4.31
    bootstrap         ==   4.0.0.beta2.1
    pg                ==   0.21.0
    simple_form       ==   3.5.0
    datagrid          ==   1.5.7
    kaminari          ==   1.1.1
```
