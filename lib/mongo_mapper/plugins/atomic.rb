module MongoMapper
  module Plugins
    module Atomic
      module InstanceMethods
        def to_mongo(atomic = false)
          if atomic && !@new
            attrs = HashWithIndifferentAccess.new
            changes.each do |k,v|
              attrs[k] = v.last
            end
            {'$set' => attrs}
          else
            attributes
          end
        end
      end
    end
  end
end
