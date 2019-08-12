Config = {}
Config.Locale = 'en'

Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}

Config.BlipHospital = {
	Sprite = 403,
	Color = 2,
	Display = 2,
	Scale = 1.0
}

Config.Price = 250 -- Edit this to your liking.

Config.EnableUnemployedOnly = false -- If true it will only show Blips to Unemployed Players | false shows it to Everyone.
Config.EnableBlips = false -- If true then it will show blips | false does the Opposite.
Config.EnablePeds = true -- If true then it will add Peds on Markers | false does the Opposite.

Config.Locations = {
	{ x = 318.77, y = -579.16, z = 42.26, heading = 270.49 },
	{ x = 1829.24, y = 3667.16, z = 33.28, heading = 214.90 },
	{ x = -240.31, y = 6324.13, z = 31.43, heading = 221.37 }
}

Config.Zones = {}

for i=1, #Config.Locations, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Locations[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
