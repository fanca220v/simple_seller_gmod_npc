util.AddNetworkString("awfawfawfawfaw")
net.Receive("awfawfawfawfaw", function(_,self)
	local weapon = net.ReadString()
	local tpe = net.ReadBool()

	if tpe==nil or tpe == false then
		self:Give(weapon)
	else
		if fan_buy_npc.cfg.weapons[tonumber(weapon)].isadmin and not self:IsSuperAdmin() then return end
		fan_buy_npc.cfg.weapons[tonumber(weapon)].func(self)
	end
end)

util.AddNetworkString("to_space")
net.Receive("to_space", function(_,self)
	if self:IsSuperAdmin() then
		local ent = net.ReadEntity()
		ent:SetVelocity( Vector(0,0,10000) )
	end
end)

print("loded")