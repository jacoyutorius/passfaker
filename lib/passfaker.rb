# frozen_string_literal: true
require_relative "passfaker/version"
require_relative "passfaker/generator"

module Passfaker
  class Error < StandardError; end
  
  def self.generate(word_count: 4, separator: "-", include_number: true)
    Generator.generate(word_count: word_count, separator: separator, include_number: include_number)
  end
end
