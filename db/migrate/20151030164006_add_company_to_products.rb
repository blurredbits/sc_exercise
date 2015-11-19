class AddCompanyToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :company, index: true
    add_foreign_key :products, :companies, column: :company_id
  end
end
