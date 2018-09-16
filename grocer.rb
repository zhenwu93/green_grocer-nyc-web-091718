def consolidate_cart(cart)
  cart_hash = {}
   cart.each do |item|
     item.each do |name, attribute|
       if cart_hash.has_key?(name)
         cart_hash[name][:count] += 1
       else
         cart_hash = cart_hash.merge({name => attribute.merge({count: 1})})
       end
     end
   end
   return cart_hash
 end

def apply_coupons(cart, coupons)
  cart_hash = cart
  
  coupons.each do |coupon|
    item_name = coupon[:item]
    if cart_hash.keys.include?(item_name)
      cart_count = cart_hash[item_name][:count]
      
      if cart_count >= coupon[:num]
        item_coup = {"#{item_name} W/COUPON" => {
          price: coupon[:cost], 
          clearance: cart_hash[item_name][:clearance], 
          count: cart_count/coupon[:num]}
        }
        
        cart_hash[item_name][:count] %= coupon[:num]
        cart_hash = cart_hash.merge(item_coup)
      end
    end
  end
  return cart_cons
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
