require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class ProductTest < Test::Unit::TestCase
  context "Product Model" do

    setup do 
      @order = Order.new(:total => 250)
      @product = Product.new(:title => "Umbrella", :price => 49.99, :image_url => 'image.jpeg', 
        :stock_level => 7, :supplier => Supplier.new(:name => "ACME Ltd."))

      @line_item = LineItem.new(:product => @product, :order => @order)
      @product.line_items << @line_item 
      @product.save!
    end

    should "have many line_items" do
      assert @product.respond_to?(:line_items)
      assert_equal 1, @product.line_items.length
      assert @product.line_items.is_a?(Array)
      assert @product.line_items.first.is_a?(LineItem)
      assert @product.line_items.first.order.is_a?(Order)
      assert_equal @product, @order.line_items.first.product
    end

    should "have many orders" do
      assert @product.respond_to?(:orders)
      assert_equal 1, @product.orders.length
    end

    should 'belong_to Supplier' do
      assert @product.respond_to?(:supplier)
      assert_not_nil @product.supplier
      assert @product.supplier.is_a?(Supplier)
    end
  end
end
