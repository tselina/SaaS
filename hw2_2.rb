class CartesianProduct
	include Enumerable

	attr_reader :product

	def initialize(x, y)
		@product = []
		x.each do |xx|
			y.each do |yy|
				@product << [xx, yy]
			end
		end
	end
	
	def each
		@product.each {|elt| yield elt}
	end
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
 
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)