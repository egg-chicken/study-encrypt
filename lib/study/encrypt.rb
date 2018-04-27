require "study/encrypt/version"
require "ecdsa"

module Study
  module Encrypt
    class << self
      def print_parameters
        group = ECDSA::Group::Secp256k1
        puts "ECDSA::Group::Secp256k1 のパラメータ"
        puts "素数    ... #{group.field.prime}"
        puts "生成元x ... #{group.generator.x}"
        puts "生成元y ... #{group.generator.y}"
        puts "係数a   ... #{group.param_a}"
        puts "係数b   ... #{group.param_b}"
        puts "位数    ... #{group.order}"
      end
    end
  end
end
