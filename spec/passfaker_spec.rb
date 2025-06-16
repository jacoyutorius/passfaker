# frozen_string_literal: true

require "spec_helper"
require "passfaker"

RSpec.describe Passfaker do
  describe ".generate" do
    it "generates a string with default options" do
      password = Passfaker.generate
      expect(password).to be_a(String)
      expect(password.split("-").size).to be >= 4
    end

    it "generates a password with specified word count and separator" do
      password = Passfaker.generate(word_count: 3, separator: "_", include_number: false)
      expect(password).to be_a(String)
      expect(password.split("_").size).to eq(3)
      expect(password).not_to match(/\d+/) # 数字なし
    end

    it "includes a number when include_number is true" do
      password = Passfaker.generate(include_number: true)
      expect(password).to match(/\d+$/)
    end
  end
end
