require "study/encrypt/version"
require "study/use_ecdsa"
require "study/use_bitcoin"
require "study/use_openssl"

module Study
  module Encrypt
    class << self
      def print_parameters
        Study::UseEcdsa.new.print_parameters
      end

      def print_keys
        Study::UseEcdsa.new.print_keys
        Study::UseBitcoin.new.print_keys
        Study::UseOpenSSL.new.print_keys
      end

      def print_signature
        Study::UseEcdsa.new.print_signature
        Study::UseOpenSSL.new.print_signature
      end
    end
  end
end
