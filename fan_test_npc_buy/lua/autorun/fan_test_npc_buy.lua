fan_buy_npc = {
	cfg = {
		weapons = {
			{
				name = "RPG",
				weapon = "weapon_rpg" -- weapon class
			},
			{
				name = "CROSSBOW",
				weapon = "weapon_crossbow"
			},
			--{
			--	name = "БРОНЯ / 100",
			--	func = function(ply)
			--		ply:SetArmor(100)
			--	end
			--},
			{
				name = "ARMOR / +100",
				func = function(ply) -- server function
					ply:SetArmor(ply:Armor()+100)
				end
			},
			--{
			--	name = "ХП / 100",
			--	func = function(ply)
			--		ply:SetHealth(100)
			--	end
			--},
			{
				name = "HP / +100",
				func = function(ply)
					ply:SetHealth(ply:Health()+100)
				end
			},
			{
				name = "RIP",
				func = function(ply)
					ply:Kill()
				end
			},
			--{
			--	name = "В КОСМОС",
			--	func = function(ply)
			--		ply:SetVelocity( Vector(0,0,10000) )
			--	end
			--},
			{
				name = "PLAYER TO SPACE",
				func = function(ply)
					ply:SendLua([[fan_buy_npc.to_space_menu()]])
				end,
				sadmin = true -- only sa
			}
		}
	}
}

if SERVER then
	include("fan_npc_buy/sv.lua")

	AddCSLuaFile("fan_npc_buy/interface.lua")
end
if CLIENT then
	include("fan_npc_buy/interface.lua")
end