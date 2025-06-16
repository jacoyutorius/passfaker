# Passfaker

## 使い方

```ruby
require "passfaker"

# デフォルト生成（4単語、ハイフン区切り、末尾に数字あり）
puts Passfaker.generate
# => "blue-dog-cheese-pikachu-42"

# カスタム生成
puts Passfaker.generate(word_count: 5, separator: "_", include_number: false)
# => "red_cat_salmon_squirtle_guitar"
```
