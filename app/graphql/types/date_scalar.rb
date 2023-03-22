module Types
  class DateScalar < GraphQL::Schema::Scalar
    description "Date type"

    def self.coerce_input(input_value, _context)
      Date.parse(input_value)
    end

    def self.coerce_result(ruby_value, _context)
      ruby_value.to_s
    end
  end
end
