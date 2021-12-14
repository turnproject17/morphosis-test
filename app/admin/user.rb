# frozen_string_literal: true

ActiveAdmin.register User, as: 'User' do
  permit_params :email, :password, role_ids: []


  filter :email

  index do
    id_column
    column :email
    column :roles
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :roles
    end
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :email, as: :string
      f.input :password, as: :password
      f.input :roles, collection: Role.pluck(:name, :id), selected: f.object.role_ids
    end
    f.actions
  end
end
