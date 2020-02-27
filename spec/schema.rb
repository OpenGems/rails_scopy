# frozen_string_literal: true

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :name

    t.boolean :admin

    t.integer :age

    t.float :weight

    t.json :parameters

    t.text :description

    t.time :created_at
  end
end
