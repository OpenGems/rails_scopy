# frozen_string_literal: true

RSpec.describe RailsScopy do
  before(:all) do
    30.times do
      parameters = {
        birthday: [Faker::Date.between(from: 20.days.ago, to: Date.today), nil].sample
      }
      User.create(name: Faker::Name.name,
                  admin: [true, false].sample,
                  age: Faker::Number.between(from: 19, to: 99),
                  weight: Faker::Number.decimal(l_digits: 2),
                  parameters: parameters,
                  description: Faker::Lorem.sentence,
                  created_at: Time.now)
    end
  end

  it 'Scopes exists' do
    User.columns.each do |column|
      name = column.name
      expect(User.respond_to?("ascend_by_#{name}")).to eql(true)
      expect(User.respond_to?("descend_by_#{name}")).to eql(true)
      %w[eq not_eq null not_null present blank].each do |key|
        expect(User.respond_to?("#{name}_#{key}")).to eql(true)
      end
    end
  end
end
