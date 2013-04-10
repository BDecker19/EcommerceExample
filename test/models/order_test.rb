require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class OrderTest < Test::Unit::TestCase
  context "Order Model" do
    setup do
      @product = Product.new(:title => "Umbrella", :price => 49.99, :stock_level => 7)

      @order = Order.new(:total => 250)
      @order.invoice = Invoice.new
      @order.line_items <<  LineItem.new(:product => @product, :order => @order, :qty => 100)
      @order.save

      @order.reload
    end

    should "have many line_items" do
      assert @order.respond_to?(:line_items)
      assert_equal 1, @order.line_items.length
      assert @order.line_items.is_a?(Array)
      assert @order.line_items.first.is_a?(LineItem)
      assert @order.line_items.first.product.is_a?(Product)
      assert_equal @product, @order.line_items.first.product
    end

    should "have many products" do
      assert @order.respond_to?(:products)
      assert_equal 1, @order.products.length
    end

    should "have one invoice" do
      assert @order.respond_to?(:invoice)
      assert_not_nil @order.invoice
      assert @order.invoice.is_a?(Invoice)
      @order.invoice.calculate_total
      assert_equal 255, @order.invoice.final_amount
    end

   
  end
end
