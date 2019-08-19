class OrdersController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @orders = Order.paginate(page: params[:page])

    data = @orders.map do |order|
      {
        ref: order.ref,
        order_type: order.order_type,
        amount: [['$',''].sample, number_with_precision(order.amount, precision: 2)].join,
        ordered_at: order.ordered_at,
        email: order.email,
        name: order.name
      }
    end

    render json: data
  end
end