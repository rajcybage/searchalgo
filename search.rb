#encoding:utf-8

x = Array.new
puts "Enter Required Input: Please put end after complete the input"
y = ''

# P Ford Car Review
# P Review Car
# P Review Ford
# P Toyota Car
# P Honda Car
# P Car
# Q Ford
# Q Car
# Q Review
# Q Ford Review
# Q Ford Car
# Q cooking French
h_p = {}
h_q = []
while y != "end"
  y = gets.chomp
  x.push y
end
x.delete ('end')
x.compact
#puts "You entered: " + x.sort.to_s
#puts "Objects in array: " + x.size.to_s

#rank of the value in the hash
def set_rank(h, val)
  h_r = {}
  h.each{|k,v| h_r[k] = v.split(" ").index(val.to_s)}
  return h_r
end  

x.each_with_index do |xx, i|
  if xx[0] == "P" || xx[0] =="p"
    h_p["P#{i+1}"] = xx.delete("P").strip!
  else
    h_q << xx.delete("Q").strip!  
  end
end

puts h_p
#puts h_q  

search_v = {}
#h_q.each do |q|
#  if q.split(" ").size == 1
#    h_p.select{|k,v| search_v[k] = v if v.include? q }
#  else
q = h_q[4]
puts q
q.split(" ").each do |qq|
  h_p.select{|k,v| search_v[k] = v if v.include? qq }

#    end   
# end   
end

puts search_v
q.split(" ").each do |qq|
  puts qq
  puts search_v
  puts set_rank(search_v, qq)
end
#h_m = Hash[search_v.sort_by{|k,v| v}]
#puts h_m.keys.join(" ")

