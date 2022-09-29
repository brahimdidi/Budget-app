require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.new(name: 'test', email: 'test@gmail.com')
    @expense = Expense.new(name: 'expense', amount: 45, user: @user)
  end

  it 'shows exact name' do
    expect(@expense.name).to eql('expense')
    expect(@expense.amount).to eql 45
  end
  it 'can not create a expense without  a name' do
    expense = Expense.new(amount: 'expense amount', user: @user)
    expect(expense.valid?).to eql false
  end
  it 'can not create a expense without  an amount' do
    expense = Expense.new(name: 'expense ', user: @user)
    expect(expense.valid?).to eql false
  end
end
