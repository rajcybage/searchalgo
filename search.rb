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

def sort_page(a, j=nil)
	a.take_while{}
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
        q.split(" ").each_with_index do |qq, j|
			h_p.select{|k,v| search_v[k] = v if v.include? qq }
		    a << set_rank(search_v, qq).reject{|k,v| v.nil?}
		    sort_page(a, j)
	    end
	end
puts "Q#{i+1}: " + main_h.keys.join(",")	 unless main_h.empty?
puts "Q#{i+1}: " + a.inject({}, :merge).keys.join(",") unless a.empty? || a.nil?
end
