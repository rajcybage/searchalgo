#encoding:utf-8

x = Array.new
puts "Enter Required Input: Please put end after complete the input"
y = ''


h_p = {}
h_q = []
while y != "end"
  y = gets.chomp
  x.push y
end
x.delete ('end')
x.compact

def set_rank(h, val)
  h_r = {}
  h.each{|k,v| h_r[k] = v.split(" ").index(val.to_s).to_i}
  h_r
end  


x.each_with_index do |xx, i|
  if xx[0] == "P" || xx[0] =="p"
    h_p["P#{i+1}"] = xx.delete("P").strip!
  else
    h_q << xx.delete("Q").strip!  
  end
end

h_q.each_with_index do |q,i|
  main_h = {}
  a = []
  search_v = {}
  if q.split(" ").size == 1
    h_p.select{|k,v| search_v[k] = v if v.include? q }
    main_h = set_rank(search_v, q)
    
  else
    common = []

       q.split(" ").each_with_index do |qq, j|
      h_p.select{|k,v| search_v[k] = v if v.include? qq }
        a << set_rank(search_v, qq).reject{|k,v| v.nil?}
      end

      a.each do |aa|
           common << (aa.to_a && a[0].to_a ).to_h
        end
        common = common.uniq 
  end
  remain = a
  remain.each do |r|
        common.each do |c|
            c.keys.each do |k|
               r.delete(k)
            end 
        end 
    end

remain = remain.inject({}, :merge).sort_by{|k,v| v}.to_h unless remain.nil?
common =  common.inject({}, :merge).sort_by{|k,v| v}.to_h unless common.nil?
r= remain.group_by{|k,v| v}
s= []
r.values.each do |v|
  s << v.sort_by{|hh| hh[0]}
end
puts s.to_a  
#puts common.merge(remain)

puts "Q#{i+1}: " + main_h.keys.join(",")   unless main_h.empty?
puts "Q#{i+1}: " + a.inject({}, :merge).keys.join(",") unless a.empty? || a.nil?
end
