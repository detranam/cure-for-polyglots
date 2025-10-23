-- This seems silly... Since Lua doesn't have any builtin memory-safety, to keep with the
-- pathos of the other tests, I think I'll just be counting up to the requied value without
-- any concurrency/threading 
CountTo = 10000000
CountMe = 0
print(string.format("Counting to %d with 1 thread.", CountTo))

for arrayVal = 1,CountTo do
    CountMe = CountMe + 1
end

print(string.format("Counter value: %d", CountMe))
