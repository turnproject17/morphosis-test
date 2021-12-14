# frozen_string_literal: true

ActiveAdmin.register Product, as: 'Product' do
  permit_params :title, :description, :image_url, :price, :sku, :stock, :region_id

  filter :title

  index do
    id_column
    column :title
    column :price
    column :region
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :image_url
      row :price
      row :sku
      row :stock
      row :region_id
    end
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title, as: :string
      f.input :description, as: :string
      f.input :image_url, as: :string
      f.input :price, as: :string
      f.input :sku, as: :string
      f.input :stock, as: :string
      f.input :region, collection: Region.pluck(:title, :id), selected: f.object.region
    end
    f.actions
  end
end
