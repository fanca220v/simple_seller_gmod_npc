surface.CreateFont("afwawfawfafw", {
font = "Arial",
size = 24,
height = 600
})
local function OpenMenu()
	local menu = vgui.Create("DFrame")
	menu:SetSize(500,600)
	menu:Center()
	menu:MakePopup()
	menu:SetTitle("seller")
	menu.Paint = function(self1,w,h)
		draw.RoundedBox(0, 0,0,w,h, Color(10,10,10))
	end
	local scroll = vgui.Create( "DScrollPanel", menu )
	scroll:Dock( FILL )

	for k,v in pairs(fan_buy_npc.cfg.weapons) do
		if v.sadmin and not LocalPlayer():IsSuperAdmin() then return end
		local Tovar = scroll:Add("DButton", menu)
		Tovar:Dock(TOP)
		Tovar:DockMargin(3, 3, 3, 0)
		Tovar:SetTall(50)
		Tovar:SetText(v.name)
		Tovar:SetFont("afwawfawfafw")
		Tovar.DoClick = function()
			if v.weapon then
				net.Start"awfawfawfawfaw"
					net.WriteString(v.weapon)
				net.SendToServer()
				chat.AddText(Color(255,0,0),"Taked: " .. v.weapon .."(" .. v.name ..")")
			else
				net.Start"awfawfawfawfaw"
					net.WriteString(k)
					net.WriteBool(true)
				net.SendToServer()
				chat.AddText(Color(255,0,0),"Activate: " .. v.name)
			end
			menu:Close()
		end
		Tovar.Paint = function(self1,w,h)
			if self1:IsHovered() then
				draw.RoundedBox(0, 0,0,w,h, Color(150,10,10))
			else
				draw.RoundedBox(0, 0,0,w,h, Color(50,50,50))
			end
		end
	end
end
net.Receive("фщцашрзфшцщанзфжцрагзфцагр", OpenMenu)

fan_buy_npc.to_space_menu = function()
	local menu = vgui.Create("DFrame")
	menu:SetSize(500,700)
	menu:Center()
	menu:SetTitle("select player")
	menu:MakePopup()
	menu.Paint = function(self1,w,h)
		draw.RoundedBox(0, 0,0,w,h, Color(10,10,10))
	end
	local scroll = vgui.Create( "DScrollPanel", menu )
	scroll:Dock( FILL )
	for k,v in pairs(player.GetAll()) do
		local pl = scroll:Add("DButton", menu)
		pl:Dock(TOP)
		pl:DockMargin(3, 3, 3, 0)
		pl:SetTall(50)
		pl:SetText(v:Name())
		pl:SetFont("afwawfawfafw")
		pl.DoClick = function()
			menu:Close()
			net.Start"to_space"
				net.WriteEntity(v)
			net.SendToServer()
		end
		pl.Paint = function(self1,w,h)
			if self1:IsHovered() then
				draw.RoundedBox(0, 0,0,w,h, Color(150,10,10))
			else
				draw.RoundedBox(0, 0,0,w,h, Color(50,50,50))
			end
		end
	end
	local pl = scroll:Add("DButton", menu)
	pl:Dock(TOP)
	pl:DockMargin(3, 3, 3, 0)
	pl:SetTall(50)
	pl:SetText("ALL")
	pl:SetFont("afwawfawfafw")
	pl.DoClick = function()
		menu:Close()
		for k,v in pairs(player.GetAll()) do
			net.Start"to_space"
				net.WriteEntity(v)
			net.SendToServer()
		end
	end
	pl.Paint = function(self1,w,h)
		if self1:IsHovered() then
			draw.RoundedBox(0, 0,0,w,h, Color(150,10,10))
		else
			draw.RoundedBox(0, 0,0,w,h, Color(50,50,50))
		end
	end
end
print("loded")