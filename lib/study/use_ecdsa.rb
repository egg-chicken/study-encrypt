require "ecdsa"
require "securerandom"
require "digest"

module Study
  class UseEcdsa
    def print_parameters
      puts "ECDSA::Group::Secp256k1 のパラメータ"
      puts "素数    ... #{group.field.prime}"
      puts "生成元x ... #{group.generator.x}"
      puts "生成元y ... #{group.generator.y}"
      puts "係数a   ... #{group.param_a}"
      puts "係数b   ... #{group.param_b}"
      puts "位数    ... #{group.order}"
    end

    def print_keys
      private_key = generate_private_key
      public_key = generate_public_key(private_key)
      puts "ecdsa ライブラリでの鍵生成"
      puts "秘密鍵  ... #{private_key}"
      puts "公開鍵x ... #{public_key.x}"
      puts "公開鍵y ... #{public_key.y}"
    end

    def print_signature
      private_key = generate_private_key
      public_key = generate_public_key(private_key)
      message = "署名を必要とする文章 ..."
      digest  = Digest::SHA256.hexdigest(message)

      k = 1 + SecureRandom.random_number(group.order - 1)
      sign = ECDSA.sign(group, private_key, digest, k)
      binary = ECDSA::Format::SignatureDerString.encode(sign)
      puts "電子署名r   ... #{sign.r}"
      puts "電子署名s   ... #{sign.s}"
      puts "電子署名DER ... #{binary.codepoints.map {|c| c.to_s(16) }.join}"
    end

    private

    def generate_private_key
      SecureRandom.random_number(group.order - 1)
    end

    def generate_public_key(private_key)
      group.generator.multiply_by_scalar(private_key)
    end

    def group
      ECDSA::Group::Secp256k1
    end
  end
end
