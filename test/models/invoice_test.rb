require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class InvoiceTest < Test::Unit::TestCase
  context "Invoice Model" do

    setup do
      @invoice = Invoice.new
      @invoice.order = Order.new(:total => 100)
      @invoice.calculate_total
      @invoice.save
      @invoice.reload
    end

    should 'belong to Order' do
      assert @invoice.respond_to?(:order)
      assert_not_nil @invoice.order
      assert @invoice.order.is_a? Order
      assert_equal 100, @invoice.order.total
      assert_equal 105, @invoice.final_amount
    end
  end
end
