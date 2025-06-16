# frozen_string_literal: true

# Passfakerモジュール
module Passfaker
  require "securerandom"
  require "faker"

  # パスワード生成のためのモジュール
  module Generator
    CATEGORIES = [
      -> { Faker::Color.color_name },
      -> { Faker::Creature::Animal.name },
      -> { Faker::Food.ingredient },
      -> { Faker::Games::Pokemon.name },
      -> { Faker::Music.instrument }
    ].freeze

    def self.generate(word_count:, separator:, include_number:)
      words = word_count.times.map do
        generator = CATEGORIES[SecureRandom.random_number(CATEGORIES.size)]
        generator.call.downcase.gsub(/\s+/, "-")
      end

      words << ::SecureRandom.random_number(100).to_s if include_number
      words.join(separator)
    end
  end
end
