module Liquid
  class LiquidError < StandardError
  end

  class LiquidUnauthorizedError < LiquidError
  end

  class LiquidInvalidDataPointError < LiquidError
  end

  class ErrorHandler
    def self.fail(error_code, message = nil)
      case error_code
      when 401
        raise LiquidUnauthorizedError.new "#{error_code}: #{message}"
      when 422
        raise LiquidInvalidDataPointError.new "#{error_code}: #{message}"
      else
        raise LiquidError.new "#{error_code}: #{message}"
      end
    end
  end
end
