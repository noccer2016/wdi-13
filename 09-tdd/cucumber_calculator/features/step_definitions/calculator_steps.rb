Given(/^I have a calculator$/) do
  @calculator = Calculator.new
end

Given(/^I have the number (-?\d+)$/) do |number|
  @calculator << number
end

When(/^I add them together$/) do
  @result = @calculator.add
end

When(/^I subtract them$/) do
  @result = @calculator.subtract
end

Then(/^I should see (-?\d+) in the terminal$/) do |num|
  assert_equal @result, num.to_f
end
