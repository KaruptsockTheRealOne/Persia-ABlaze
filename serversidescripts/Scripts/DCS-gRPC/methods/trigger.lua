--
-- RPC trigger actions
-- https://wiki.hoggitworld.com/view/DCS_singleton_trigger
--

-- All MarkPanels must have a unique ID but there is no way of
-- delegating the creationg of this ID to the game, so we have
-- to have the following code to make sure we always get a new
-- unique id
local MarkId = 0

local function getMarkId()
    local panels =  world.getMarkPanels()
    local idx = MarkId
    if panels then
        local l_max = math.max
        for _,panel in ipairs(panels) do
            idx = l_max(panel.idx, idx)
        end
    end
    idx = idx + 1
    MarkId = idx
    return idx
end

GRPC.methods.outText = function(params)
  trigger.action.outText(params.text, params.displayTime, params.clearView)

  return GRPC.success(nil)
end

GRPC.methods.outTextForCoalition = function(params)
  if params.coalition == 0 then
    return GRPC.errorInvalidArgument("a specific coalition must be chosen")
  end

  -- Decrement for non zero-indexed gRPC enum
  trigger.action.outTextForCoalition(params.coalition - 1, params.text, params.displayTime, params.clearView)

  return GRPC.success(nil)
end

GRPC.methods.outTextForGroup = function(params)
  trigger.action.outTextForGroup(params.groupId, params.text, params.displayTime, params.clearView)

  return GRPC.success(nil)
end

GRPC.methods.getUserFlag = function(params)
  return GRPC.success({
    value = trigger.misc.getUserFlag(params.flag),
  })
end

GRPC.methods.setUserFlag = function(params)
  trigger.action.setUserFlag(params.flag, params.value)
  return GRPC.success(nil)
end

GRPC.methods.markToAll = function(params)
  local point = coord.LLtoLO(params.position.lat, params.position.lon, params.position.alt)
  local idx = getMarkId()

  trigger.action.markToAll(idx, params.text, point, params.readOnly, params.message)

  return GRPC.success({
    id = idx
  })
end

GRPC.methods.markToCoalition = function(params)
  local point = coord.LLtoLO(params.position.lat, params.position.lon, params.position.alt)
  local idx = getMarkId()

  trigger.action.markToCoalition(idx, params.text, point, params.coalition, params.readOnly, params.message)

  return GRPC.success({
    id = idx
  })
end

GRPC.methods.markToGroup = function(params)
  local point = coord.LLtoLO(params.position.lat, params.position.lon, params.position.alt)
  local idx = getMarkId()

  trigger.action.markToGroup(idx, params.text, point, params.groupId, params.readOnly, params.message)

  return GRPC.success({
    id = idx
  })
end

GRPC.methods.removeMark = function(params)
  trigger.action.removeMark(params.id)

  return GRPC.success(nil)
end

GRPC.methods.explosion = function(params)
  local point = coord.LLtoLO(params.position.lat, params.position.lon, params.position.alt)

  trigger.action.explosion(point, params.power)

  return GRPC.success(nil)
end

-- gRPC enums should avoid 0 so we increment it there and then subtract by 1
-- here since this enum is zero indexed.
GRPC.methods.smoke = function(params)
  if params.color == 0 then
    return GRPC.errorInvalidArgument("color cannot be unspecified (0)")
  end
  local point = coord.LLtoLO(params.position.lat, params.position.lon, 0)
  local groundPoint = {
    x = point.x,
    y = land.getHeight({x = point.x, y = point.z}),
    z = point.z
  }

  trigger.action.smoke(groundPoint, params.color - 1)

  return GRPC.success(nil)
end

GRPC.methods.illuminationBomb = function(params)
  local point = coord.LLtoLO(params.position.lat, params.position.lon, 0)
  local groundOffsetPoint = {
    x = point.x,
    y = land.getHeight({x = point.x, y = point.z}) + params.position.alt,
    z = point.z
  }

  trigger.action.illuminationBomb(groundOffsetPoint, params.power)

  return GRPC.success(nil)
end

-- gRPC enums should avoid 0 so we increment it there and then subtract by 1
-- here since this enum is zero indexed.
GRPC.methods.signalFlare = function(params)
  if params.color == 0 then
    return GRPC.errorInvalidArgument("color cannot be unspecified (0)")
  end
  local point = coord.LLtoLO(params.position.lat, params.position.lon, 0)
  local groundPoint = {
    x = point.x,
    y = land.getHeight({x = point.x, y = point.z}),
    z= point.z}

  trigger.action.signalFlare(groundPoint, params.color - 1, params.azimuth)

  return GRPC.success(nil)
end