require "bitcoin"

module Study
  class UseBitcoin
    def print_keys
      keys = Bitcoin.generate_key
      puts "bitcoin ライブラリでの鍵生成"
      puts "秘密鍵  ... #{keys[0]}"
      puts "公開鍵  ... #{keys[1]}"
    end
  end
end
