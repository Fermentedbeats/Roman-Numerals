require 'sinatra'

get("/") do
  arabic_string = params.fetch("roman")
  arabic_number = arabic_string.to_i
  roman=romnum(arabic_number)
  "<form><input name='roman'/><button>submit</button></form>"+
  "<h1>#{roman}</h1>"
end

def romnum(int)
  conv = []

  conv << ('M' * (int / 1000))
    conv << ('D' * (int % 1000 / 500))
    conv << ('C' * (int % 500 / 100))
    conv << ('L' * (int % 100 / 50))
    conv << ('X' * (int % 50 / 10))
    conv << ('V' * (int % 10 / 5))
    conv << ('I' * (int % 5 / 1))

conv2 = conv.join
conv2.to_s
  conv2.gsub!("DCCCC", "CM")  # converting 9 hundo
  conv2.gsub!("CCCC", "CD")   # 400
  conv2.gsub!("LXXXX", "XC")  # 90
  conv2.gsub!("XXXX", "XL")   # 40
  conv2.gsub!("VIIII", "IX")  # 9
  conv2.gsub!("IIII", "IV")   # 4

return conv2

end
