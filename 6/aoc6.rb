# # first part

# f = File.open('file6')

# d = f.readlines
#      .map(&:chomp)
#      .map(&:chars)
#      .flatten
# f.close

# puts (0..d.length-4).to_a.each_with_index.map{ |n, idx| ((a = d[n..n+3]).uniq == a)? idx : false }.find{ |n| n.instance_of? Fixnum } + 4

# second part

f = File.open('file6')

d = f.readlines
     .map(&:chomp)
     .map(&:chars)
     .flatten
f.close

puts (0..d.length-14).to_a.each_with_index.map{ |n, idx| ((a = d[n..n+13]).uniq == a)? idx : false }.find{ |n| n.instance_of? Fixnum } + 14
