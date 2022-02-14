local lights_on = {}

local function parse_record (s)
  local _, _, lower_bound, upper_bound = string.find(s, "%p(%d+)%p%s?(%d+)%p")
  return lower_bound, upper_bound
end

local function record_presence (lower_bound, upper_bound)
  for i = lower_bound, upper_bound - 1 do
    lights_on[i] = true
  end
end

local function count_results ()
  local count = 0

  for _, val in pairs(lights_on) do
    if val == true then
      count = count + 1
    end
  end

  return count
end

local function main ()
  io.input("./data.txt")
  while true do
    local record = io.read()
    if (record == nil) then
      break
    end
    record_presence(parse_record(record))
  end

  io.write("Result: ", count_results(), "\n")
end

main()
