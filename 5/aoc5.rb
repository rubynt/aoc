# # first part
# f = File.open('file5')
# d = f.readlines
#       .map(&:chomp)
# numbers = (d.each_with_index.map{ | n, idx | idx.inspect if n[0..1] == ' 1' }.compact)[0].to_i
# l = d[numbers].split.map(&:to_i)[-1]
# b = Hash[(1..l).to_a.map{ |n| [n, []] }]
# d[0..numbers-1].map{ |n| n.chars }
#                .each{ |n| n.each_slice(4)
#                .with_index{ | m, idx | ( b[idx+1].unshift(m[1]) ) if m[1] != ' ' } }
# d[l+1..].map(&:split)
#         .each{ |n| (0..( n[1].to_i - 1 ))
#         .to_a.each{ b[ n[5].to_i ] << b[ n[3].to_i ].pop } }

# puts b.map{ | k, v | v[-1] }.join

# f.close()









f = File.open('file5')

d = f.readlines
      .map(&:chomp)

f.close()

numbers = (d.each_with_index.map{ | n, idx | idx.inspect if n[0..1] == ' 1' }.compact)[0].to_i

l = d[numbers].split.map(&:to_i)[-1]

b = Hash[(1..l).to_a.map{ |n| [n, []] }]

d[0..numbers-1].map{ |n| n.chars }
               .each{ |n| n.each_slice(4)
               .with_index{ | m, idx | ( b[idx+1].unshift(m[1]) ) if m[1] != ' ' } }

d[l+1..].map(&:split)
        .each{ |n| b[ n[5].to_i ].push(*b[ n[3].to_i ].slice!(-(n[1].to_i)..)) }

puts b.map{ | k, v | v[-1] }.join
