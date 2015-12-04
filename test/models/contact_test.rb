require 'test_helper'
require 'pry'
class ContactTest < ActiveSupport::TestCase

  test 'validates that first_name is present' do
    contact = Contact.new(last_name: "Solo", birthday: "1975-10-20")
    contact.valid?
    assert contact.errors.messages[:first_name].include?("can't be blank")
  end

  test 'validates that last_name is present' do
    contact = Contact.new(first_name: "Han", birthday: "1975-10-20")
    contact.valid?
    assert contact.errors.messages[:last_name].include?("can't be blank")
  end

  test 'validates that birthday is present' do
    contact = Contact.new(first_name: "Han", last_name: "Solo")
    contact.valid?
    assert contact.errors.messages[:birthday].include?("can't be blank")
  end
end
