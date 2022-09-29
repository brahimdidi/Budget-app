class ExpensesController < ApplicationController
  def index
    @Expenses = Expense.all
  end
end
