# frozen_string_literal: true

ActiveAdmin.register PaymentGateway, as: 'PaymentGateway' do
  permit_params :name, :ssid, :sstoken

  filter :name

  index do
    id_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
      row :ssid
      row :sstoken
    end
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :name, as: :string
      f.input :ssid, as: :string
      f.input :sstoken, as: :string
    end
    f.actions
  end
end
