class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

5.dollars.in(:euros)  # 5 / 1.292
10.euros.in(:rupees)  #
1.dollar.in(:rupees)
1.dollar.in(:rupee)
10.rupees.in(:euro)
10.rupee.in(:euro)    
