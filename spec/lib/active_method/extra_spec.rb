require 'spec_helper'
require_relative '../../../lib/alchemy_language/active_method/extra'

describe AlchemyLanguage::ActiveMethod::Extra do
  subject(:extra) { AlchemyLanguage::ActiveMethod::Extra }

  it "has self method that it called add_component" do
    is_expected.to respond_to(:add_method)
  end

  context "define dynamic methods" do
    subject(:instance_extra) { extra.new }

    it "define methods dinamix with define component method" do
      is_expected.not_to respond_to(:test_method)

      extra.add_method :test_method

      is_expected.to respond_to(:test_method)
    end

    it "This shows what is inside blocks" do
    end
  end
end
