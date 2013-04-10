require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class SupplierTest < Test::Unit::TestCase
  context "Supplier Model" do

    setup do
      @supplier = Supplier.new(:name => "ACME Ltd.")
      @supplier.products << Product.new(:title => "Umbrella", :price => 49.99, :stock_level => 7)
      @supplier.products << Product.new(:title => "Magic Beans", :price => 2.99, :stock_level => 498)      
      @supplier.products << Product.new(:title => "Surfboard", :price => 800.00, :stock_level => 0)
      @supplier.save
      @supplier.reload
    end

    should 'construct new instance' do
      assert @supplier.respond_to?(:products)
      assert_not_nil @supplier.products
      assert @supplier.products.is_a?(Array)
      assert_equal 3, @supplier.products.length
      assert @supplier.products.first.is_a?(Product)
      assert_equal "Umbrella", @supplier.products.first.title
      assert_equal 49.99, @supplier.products.first.price
      assert_equal 7, @supplier.products.first.stock_level

      umbrella = @supplier.products.first
      assert_not_nil umbrella.supplier
      assert_equal @supplier, umbrella.supplier
    end
  end
end
