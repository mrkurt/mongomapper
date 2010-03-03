module MongoMapper
  module Plugins
    module Atomic
      module InstanceMethods
        def to_mongo(atomic = false)
          attrs = attributes
          if atomic && !@new
            attrs.delete_if{ |k,v| !changes.has_key?(k) }
            {'$set' => attrs}
          else
            attrs
          end
        end
      end
    end
  end
end
