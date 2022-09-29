class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @user = User.find(current_user.id)
    @group = Group.find(params[:id])
    @expensegroups = ExpenseGroup.where(group: @group)
    @expenses = []
    @expensegroups.each do |exgroup|
      @expenses << exgroup.expense
    end
  end

  def new
    @user = current_user
    @groups = Group.all
    expense = Expense.new
    respond_to do |format|
      format.html { render :new, locals: { expense: } }
    end
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @group = Group.find(params[:group_id])
    @expense.groups << @group
    if @expense.save
      flash[:notice] = 'expense was saved successfully'
      redirect_to user_expenses_path(current_user)
    else
      flash.now[:notice] = 'Error:expense could not be saved'
      render :new, locals: { expense: @expense }
    end
  end

  def expense_params
    params.permit(:name, :amount, :group, :user)
  end
end
