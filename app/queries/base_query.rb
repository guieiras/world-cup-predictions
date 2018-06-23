class BaseQuery
  attr_reader :payload

  def self.execute(payload = {})
    new(payload).execute
  end

  def initialize(payload)
    @payload = OpenStruct.new(payload)
  end

  def build
    raise '#build must be implemented on BaseQuery children'
  end

  def schema
    nil
  end

  def raw_execute
    ActiveRecord::Base.connection.execute(build)
  end

  def execute
    rows = raw_execute
    if schema
      rows.map do |row|
        OpenStruct.new(row.map.with_index { |column, idx| [schema[idx], column[1]] }.to_h)
      end
    else
      rows
    end
  end
end
