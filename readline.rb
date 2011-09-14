
@@ -8435,21 +8435,20 @@
count -= 1
end

+ str = (flags == MB_FIND_NONZERO) ? string.strip : string
+
case @encoding
when 'E'
- point += string[point..-1].scan(/./me)[0,count].to_s.length
+ point += str[point..-1].scan(/./me)[0,count].to_s.length
when 'S'
- point += string[point..-1].scan(/./ms)[0,count].to_s.length
+ point += str[point..-1].scan(/./ms)[0,count].to_s.length
when 'U'
- point += string[point..-1].scan(/./mu)[0,count].to_s.length
+ point += str[point..-1].scan(/./mu)[0,count].to_s.length
when 'X'
- point += string[point..-1].force_encoding(@encoding_name)[0,count].byt
+ point += str[point..-1].force_encoding(@encoding_name)[0,count]..bytesi
else
point += count
end
- if flags == MB_FIND_NONZERO
- point = string.length if point>=string.length
- end
point
end
