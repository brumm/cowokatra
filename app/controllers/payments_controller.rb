class PaymentsController < ApplicationController
  before_action :load_user

  def create
    @payment = @user.payments.new payment_params
    if @payment.save!
      message = "#{view_context.number_to_currency @payment.amount} eingezahlt"
      redirect_to user_path(id: @user.id), notice: message
    else
      redirect_to user_path(id: @user.id), alert: '¡ NIETE !'
    end
  end

  def payoff
    report_date = Date.parse(payoff_params)
    amount = @user.orders.where(created_at: report_date.beginning_of_month..report_date.end_of_month).sum(:price)
    @payment = @user.payments.create booked_at: report_date, amount: amount

    redirect_to :reporting
  end

  private

  def payment_params
    params.require(:payment).permit(:amount)
  end

  def payoff_params
    params.require(:month)
  end

  def load_user
    @user = User.find params[:id]
  end
end
