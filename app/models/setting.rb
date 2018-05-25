# RailsSettings Model
class Setting < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  namespace Rails.env

  def self.to_h
    settings = {}
    get_all.each do |key, value|
      if value.is_a? Hash
        settings[key] = value
      elsif key.match(/\./)
        namespaced_key = key.split('.')
        settings[namespaced_key[0]] ||= {}
        settings[namespaced_key[0]][namespaced_key[1..-1].join('_')] = value
      end
    end

    settings
  end
end
