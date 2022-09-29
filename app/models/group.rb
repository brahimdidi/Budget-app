class Group < ApplicationRecord
  belongs_to :user

  has_many :expense_groups
  has_many :expenses, through: :expense_groups

  validates :name, presence: true

  def total_amount
    @sum = 0

    expenses.each do |expense|
     @sum += expense.amount
    end
    @sum
  end
end
