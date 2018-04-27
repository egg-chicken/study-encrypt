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

    def print_signature
      message = "署名を必要とする文章 ..."
      ec = OpenSSL::PKey::EC.new('secp256k1')
      keys = ec.generate_key
      digest = OpenSSL::Digest::SHA256.hexdigest(message)
      sign = keys.dsa_sign_asn1(digest)

      puts "openssl ライブラリでの署名と検証"
      puts "署名        ... #{sign.codepoints.map {|c| c.to_s(16) }.join}"
      puts "署名の検証  ... #{keys.dsa_verify_asn1(digest, sign)}"
    end
  end
end
