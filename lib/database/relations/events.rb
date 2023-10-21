module Database
  module Relations
    class Events < ROM::Relation[:yaml]
      schema :events do
        attribute :number, ROM::Types::Integer
        attribute :date, ROM::Types::Date

        attribute :talks, ROM::Types::Array
      end
    end
  end
end
