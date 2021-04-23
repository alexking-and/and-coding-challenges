L = {}

function P(s)
  local _,_,x,y=string.find(s, "%p(%d+)%p%s?(%d+)%p")
  return x,y
end

function R(x,y)
  for i=x,y-1 do L[i]=true end
end

function C()
  local c=0
  for _,v in pairs(L) do if v==true then c=c+1 end end
  return c
end

function M()
  io.input("./data.txt")
  while true do
    local r=io.read()
    if r==nil then break end
    R(P(r))
  end
  io.write(C(),"\n")
end

M()
