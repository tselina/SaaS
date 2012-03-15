class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
	singular_currency = currency.to_s.gsub( /s$/, '')

    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
	
  end
end

#20.euros
puts 5.dollars.in(:euros)  # 5 / 1.292
# puts 10.euros.in(:rupees)  #
# puts 1.dollar.in(:rupees)
# puts 1.dollar.in(:rupee)
# puts 10.rupees.in(:euro)
# puts 10.rupee.in(:euro)    
