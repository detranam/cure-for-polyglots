itemCount = tonumber(arg[1],10)
print(string.format("Testing a push/pop of %d builtin items.", itemCount))
table = {}
evenNumberCount = 0
for arrayVal = 0,itemCount do
    table[arrayVal] = arrayVal
end

for arrayVal = 0,itemCount do
    if table[arrayVal]%2==0
    then
        evenNumberCount = evenNumberCount + 1
    end
    table[arrayVal] = nil
end

print(string.format("There were %d even numbers.", evenNumberCount))