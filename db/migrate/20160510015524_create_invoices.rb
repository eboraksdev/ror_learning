class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.datetime :date
      t.string :company
      t.string :tax
      t.string :salesperson

      t.timestamps null: false
    end
  end
end
