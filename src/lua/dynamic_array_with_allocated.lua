itemCount = tonumber(arg[1],10)
print(string.format("Testing a push/pop of %d allocated items.", itemCount))
table = {}
for arrayVal = 1,itemCount do
    table[arrayVal] = tostring(arrayVal)
end

-- TODO: How do I replicate the 'pop' of the items in a garbage collected language? Should I?