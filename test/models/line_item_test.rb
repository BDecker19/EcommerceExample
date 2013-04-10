require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class LineItemTest < Test::Unit::TestCase
  context "LineItem Model" do
    should 'construct new instance' do
      @line_item = LineItem.new
      assert_not_nil @line_item
    end
  end
end
