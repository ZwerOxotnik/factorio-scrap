local startup_settings = {
	{type = "double-setting", name = "scrap_drop_chance_upon_destruction", default_value = 10, minimal_value = 0, maximal_value = 100},
	{type = "double-setting", name = "scrap_mining_time",   default_value = 0.4, minimal_value = 0},
	{type = "int-setting",    name = "scrap_multiplier",    default_value = 1, minimal_value = 1, maximal_value = 1000},
	{type = "bool-setting",   name = "scrap_basic_items",   default_value = true},
	{type = "bool-setting",   name = "scrap_circuit_items", default_value = false},
	{type = "bool-setting",   name = "scrap_steel_items",   default_value = false},
}
for _, data in pairs(startup_settings) do
	data.setting_type = "startup"
end
data:extend(startup_settings)
