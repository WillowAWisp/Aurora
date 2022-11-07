-- Aurora
--
-- File : init.lua
--
-- Description : Ran on computer init, This is ran before we load the correct kernel.
--
-- Author : Koral Bracker


-- Low level init table.

local init_table = {}
local init_table.devices = {}
local init_table.init_functions = {}
local init_table.driver_functions = {}

--

local init_table.devices.gpu = component.list("gpu")()
local init_table.devices.screen = component.list("screen")()

--

local init_table.driver_functions.gpu_run_cmd = function(op, arg, ...)

  if type(arg) == "table" then
    res[#res + 1] = {component.invoke(init_table.devices.gpu, op, table.unpack(arg[n]))}
  else
    res[#res + 1] = {component.invoke(init_table.devices.gpu, op, arg, ...)}
  end
  
  return res

end

--

local init_table.init_functions.video_init = function(width, height)

  component.invoke(init_table.devices.gpu, "bind", init_table.devices.screen)

end

init_table.init_functions.video_init()
init_table.driver_functions.gpu_run_cmd("setBackground", 0xFFFFFF)

