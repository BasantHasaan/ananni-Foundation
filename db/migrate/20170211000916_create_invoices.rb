class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_serial
      t.date :date
      t.string :customer
      t.string :item
      t.integer :quantity
      t.integer :unit_price
      t.decimal :discount
      t.decimal :tax

      t.timestamps
    end
  end
end
