# frozen_string_literal: true

require_relative "lib/passfaker/version"

Gem::Specification.new do |spec|
  spec.name = "passfaker"
  spec.version = Passfaker::VERSION
  spec.authors = ["jacoyutorius"]
  spec.email = ["jacoyutorius@gmail.com"]

  spec.summary = "複数の単語を組み合わせたパスフレーズを生成するRubyGem。"
  spec.description = "Passfakerは、Fakerを使用して複数の単語を組み合わせたパスフレーズを生成するRubyGemです。パスワードの強度を向上させるために、ランダムな単語とオプションで数字を含めることができます。" # rubocop:disable Layout/LineLength
  spec.homepage = "https://github.com/jacoyutorius/passfaker"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jacoyutorius/passfaker"
  spec.metadata["changelog_uri"] = "https://github.com/jacoyutorius/passfaker"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      # (f == gemspec) ||
      #
      f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "faker", "~> 2.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
