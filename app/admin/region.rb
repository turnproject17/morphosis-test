# frozen_string_literal: true

ActiveAdmin.register Region, as: 'Region' do
  permit_params :title, :country, :currency, :tax

  filter :title

  index do
    id_column
    column :title
    column :country
    column :currency
    actions
  end

  show do
    attributes_table do
      row :title
      row :country
      row :currency
    end
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :title, as: :string
      f.input :country, as: :string#, collection: Region::COUNTRY, selected: f.object.country
      f.input :currency, collection: Region.currencies.keys, selected: f.object.currency
    end
    f.actions
  end
end
