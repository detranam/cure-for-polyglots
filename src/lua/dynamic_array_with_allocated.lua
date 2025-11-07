itemCount = tonumber(arg[1],10)
print(string.format("Testing a push/pop of %d allocated items.", itemCount))
charcount = 0
table = {}
for arrayVal = 0,itemCount do
    table[arrayVal] = tostring(arrayVal)
end

for arrayVal = 0,itemCount do
    charcount = charcount + string.len(table[arrayVal])
    table[arrayVal] = nil
end

print(string.format("There were %d characters written", charcount))