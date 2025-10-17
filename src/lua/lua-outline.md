# Lua Testing

## Relevant Language Version and Compiler Information
I'm utilizing Lua and Luac version 5.4.8.

## Compile Commands
```bash luac -o outchunkname yourfile.lua```

## Executable Location
None- the filees are interpreted, so you just run them: ```bash lua yourfile.lua```. However, if you're using the included build_this.sh, they will be placed in a build/ directory for convenience.

## Special Considerations

### Interpreted Language
Since Lua is an interpreted language, any file sizes we have will need to be added to the size of the Lua interpreter itself, which I've built from source locally. Based on running ```bash ls -la $(which lua)```, my Lua interpreter is 314624 bytes. To note, however, if this were being deployed into a system, the additional space would only be used once. However, since this benchmarking is meant to be 'all the things you need' to run a file, it will be taken into account. 

### Notes on luac 
Another note on Lua is that there isn't a code size benefit to using luac (the compiler). Per [the website](https://www.lua.org/manual/5.4/luac.html), there are a few benefits to using it, one of which is speed of loading. I will be using the luac files when trying to get fastest runtime.

### LuaJIT
LuaJIT seems to be the best way to get even more performant Lua code. I haven't investigated it yet, but once all the tests are written, I'll look into how much overhead / benefit there is to using LuaJIT.