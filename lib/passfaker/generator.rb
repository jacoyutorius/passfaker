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
      -> { Faker::Music.instrument },
      -> { Faker::Superhero.name },
      -> { Faker::Music.genre }
    ].freeze

    def self.generate(word_count:, separator:, include_number:)
      words = word_count.times.map do
        generator = CATEGORIES[SecureRandom.random_number(CATEGORIES.size)]
        word = generator.call.downcase.gsub(/\s+/, "")
        random_char_upcase(word)
      end

      words << ::SecureRandom.random_number(100).to_s if include_number
      words.shuffle.join(separator)
    end

    # ランダムな文字を大文字に変換する
    def self.random_char_upcase(word)
      return word if word.empty?

      chars = word.chars
      index = SecureRandom.random_number(chars.size)
      chars[index] = chars[index].upcase
      chars.join
    end
  end
end
