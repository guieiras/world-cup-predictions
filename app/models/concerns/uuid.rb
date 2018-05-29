module Uuid
  extend ActiveSupport::Concern
  included do
    after_initialize { self.uuid ||= SecureRandom.uuid }
  end

  class_methods do
    def find_by_uuid uuid
      find_by uuid: uuid
    end
  end
end
