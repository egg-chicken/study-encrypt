require "openssl"

module Study
  class UseOpenSSL
    def print_keys
      ec = OpenSSL::PKey::EC.new('secp256k1')
      keys = ec.generate_key
      puts "openssl ライブラリでの鍵生成"
      puts "秘密鍵  ... #{keys.private_key}"
      puts "公開鍵  ... #{keys.public_key.to_bn}"
    end
  end
end
