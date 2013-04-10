class Invoice < ActiveRecord::Base
  belongs_to :order

  def calculate_total
    self.final_amount = order.total + 5
  end

end
