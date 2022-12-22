# # first part

# f = File.open('file4')
# d = f.readlines
#      .map{ |n| n.strip
#                 .split(',')
#                 .map{ |m| m.split('-')
#                         .map(&:to_i) } }
#      .map{ |m| ((a = (m[0][0]..m[0][1]).to_a ).length >=
#                 (b = (m[1][0]..m[1][1]).to_a ).length)? (b-a).empty? :
#                                                         (a-b).empty? }
#      .count(true)
# f.close

# puts d

# second part

f = File.open('file4')
d = f.readlines
     .map{ |n| n.strip
                .split(',')
                .map{ |m| m.split('-')
                        .map(&:to_i) } }
     .map{ |m| ((a = (m[0][0]..m[0][1]).to_a ).length >=
                (b = (m[1][0]..m[1][1]).to_a ).length)? (b-a).size != b.size :
                                                        (a-b).size != a.size }
     .count(true)
f.close

puts d

