class Dessert
	def initialize(name, calories)
		@name, @calories = name, calories
	end
	
	def name
		@name
	end
	
	def name=(name)
		@name = name
	end
	
	def calories
		@calories
	end
	
	def calories=(calories)
		@calories = calories
	end
	
	def healthy?
		@calories.to_i < 200
	end
	
	def delicious?
		true
	end
end
	
class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end
	
	def flavor
		@flavor
	end
	
	def flavor=(flavor)
		@flavor = flavor
	end

	def delicious?
		@flavor != "black licorice"
	end
	
end

# a = Dessert.new("cake", 101)
# puts a.to_s
# puts a.healthy?
# puts a.delicious?
# puts a.name()
# a.name = 'cake3'
# puts a.name
# a.calories = 200
# puts a.calories()
# puts a.healthy?

# b = JellyBean.new('cake2', 100, 'sweet')
# puts b.to_s
# puts b.name()
# puts b.healthy?
# puts b.delicious?
# puts b.flavor()
# b.flavor = 'black licorice'
# puts b.flavor()
# puts b.delicious?