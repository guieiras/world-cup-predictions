class Package
  class << self
    delegate :keys, :values, to: :to_h

    def to_h
      @hash ||= JSON.parse(File.open(Rails.root.join('package.json')).read)
    end

    def name
      method_missing(:name)
    end

    def method_missing(m, *args, &block)
      to_h[m.to_s]
    end
  end
end
