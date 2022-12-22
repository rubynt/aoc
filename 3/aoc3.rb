# f = File.open('file3')
# alphabet = Hash[(('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.map{ |a, indx| [a, indx+1] }]
# d = f.readlines
#       .map(&:chomp)
#       .map(&:split)
#       .map{ |n| n[0].chars }
#       .map{ |n| alphabet[ ( n.slice( 0, (s = n.size) / 2) & n.slice( s/2, s) )[0] ] }
#       .sum
# f.close()
# puts d.inspect

f = File.open('file3')
alphabet = Hash[(('a'..'z').to_a + ('A'..'Z').to_a).each_with_index.map{ |a, indx| [a, indx+1] }]
d = f.readlines
      .map(&:chomp)
      .map{ |n| n.chars }
      .each_slice(3).map{ |n| (n[0] & n[1] & n[2])[0] }
      .map{ |n| alphabet[n] }
      .sum
f.close()
puts d.inspect
# 2508
