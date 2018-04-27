require "ecdsa"
require "securerandom"

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

    def generate_private_key
      SecureRandom.random_number(group.order - 1)
    end

    def generate_public_key(private_key)
      group.generator.multiply_by_scalar(private_key)
    end

    private

    def group
      ECDSA::Group::Secp256k1
    end
  end
end
