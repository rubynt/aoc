# m = {'A' => 0, 'B' => 1, 'C' => 2, 'X' => 0,  'Y' => 1,  'Z' => 2 }
# v = [1,2,3]
# f = File.open("file")
# sum = f.readlines
#        .map(&:chomp)
#        .map(&:split)
#        .map{ |n|  n.map{ |i| m[i] } }
#        .map{ |n| (n[0] ==  n[1])? 3 + v[n[1]] : ( v[n[0]-1] == v[n[1]] )? v[n[1]] : 6 + v[n[1]]}.sum
# f.close()

# puts sum

m = {'A' => 0, 'B' => 1, 'C' => 2, 'X' => 0,  'Y' => 1,  'Z' => 2 }
v = [1,2,3]
f = File.open("file")
sum = f.readlines
       .map(&:chomp)
       .map(&:split)
       .map{ |n| [ m[n[0]], (n[1] == 'X') ? m[n[0]]-1:
                                                      (n[1] == 'Y')? m[n[0]] :
                                                                                (m[n[0]]+1)%3 ] }
       .map{ |n| (n[0] ==  n[1])? 3 + v[n[1]] : ( v[n[0]-1] == v[n[1]] )? v[n[1]] : 6 + v[n[1]]}.sum
f.close()

puts sum

