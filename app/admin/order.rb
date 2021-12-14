# frozen_string_literal: true

ActiveAdmin.register Order, as: 'Order' do
  permit_params :number, :country, :currency, :tax

  filter :number

  index do
    id_column
    column :number
    column :state
    column :user
    actions
  end

  show do
    attributes_table do
      row :number
      row :state
      row :user
      row :payment_histories
      row :products do |order|
        order.line_items&.collect(&:product)
      end
      row :customer_name
      row :shipping_address
      row :order_total
      row :paid_at

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
