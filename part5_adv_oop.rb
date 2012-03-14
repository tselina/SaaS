=begin
class Module
  def attr_accessor(*methods)
    options = methods.last.is_a?(Hash)? methods.pop: {}
    methods.each do |method|
      raise TypeError.new("method name is not symbol") unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}") ||
          instance_variable_set("@#{method}", options[:default])
      end
      define_method("#{method}=") do |v|
        instance_variable_set("@#{method}", v)
      end
    end
  end
end
=end

class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s         # make sure it's a string

		attr_reader attr_name              # create the attribute's getter
		attr_reader attr_name + "_history" # create bar_history getter

		class_eval %Q"
            def #{attr_name}=(value)
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                @#{attr_name} = value
                @#{attr_name}_history << value
            end
        "
	end
	
  def attr_accessor_with_history(*methods)
    #options = methods.last.is_a?(Hash)? methods.pop: {}
    methods.each do |method|
      raise TypeError.new("method name is not symbol") unless method.is_a?(Symbol)
      define_method(method) do
        instance_variable_get("@#{method}") # ||
          #instance_variable_set("@#{method}", options[:default])
      end
      define_method("#{method}=") do |v|
        instance_variable_set("@#{method}", v)
      end
    end
  end
	
end

class Foo
	attr_accessor_with_history :bar
end

puts f = Foo.new
puts f.bar = 1
puts f.bar = 2
puts f.bar_history.to_s # => if your code works, should be [nil,1,2]