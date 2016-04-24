class Module
	def attribute name, &block
		name, value = name.keys[0], name.values[0] if name.is_a? Hash 
		value ||= nil

		define_method "#{name}" do 
			unless instance_variable_defined? :"@#{name}"
        instance_variable_set :"@#{name}", block_given? ? instance_eval(&block) : value
      end
			instance_variable_get :"@#{name}"
		end

		define_method "#{name}=" do |value|
			instance_variable_set :"@#{name}", value
		end

		define_method "#{name}?" do 
			instance_variable_get(:"@#{name}") != nil
		end
	end
end



