function hasPermissions(xPlayer)
    local playerGroup = xPlayer.getGroup()
    if playerGroup == "steam" then
        return true
    end
	return false
end