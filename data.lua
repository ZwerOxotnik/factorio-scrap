local lazyAPI = require("__zk-lib__/experimental/lazyAPI")


local SCRAP_MINING_TIME = settings.startup["scrap_mining_time"].value


scrap_data = {}


data:extend({
  {
    type = "autoplace-control",
    name = "scraps",
    order = "c-y",
    category = "terrain"
  },
  {
    type = "noise-expression",
    name = "scrap_noise",
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 137,\z
                                    octaves = 4,\z
                                    persistence = 0.9,\z
                                    input_scale = 0.15 * var('control:scraps:frequency'),\z
                                    output_scale = 1} + 0.25 + 0.75 * (slider_rescale(control:scraps:size, 1.5) - 1)"
  },
  {
    type = "noise-expression",
    name = "scrap_density",
    expression = "scrap_noise - max(0, 1.1 - distance / 32)"
  }
})

data:extend{
  {
    type = "simple-entity",
    name = "spaceship-wreck-big-1",
    localised_name = {"entity-name.crash-site-spaceship-wreck-big"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-big-1.png",
    default_status = "broken",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 150,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.45, -0.05}, {0.7, 0.6}},
    selection_box = {{-0.9, -0.1}, {1.4, 1.2}},
    drawing_box_vertical_extension = 1.9,
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-1-ground.png",
      priority="high",
      width = 348,
      height = 136,
      shift = util.by_pixel(-27, 31),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-1.png",
          width = 234,
          height = 280,
          shift = util.by_pixel(-7, -8),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-1-shadow.png",
          width = 256,
          height = 44,
          shift = util.by_pixel(37, 26),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[big1]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.0001,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    },
  }, -- Spaceship Wreck Big 1
  {
    type = "simple-entity",
    name = "spaceship-wreck-big-2",
    localised_name = {"entity-name.crash-site-spaceship-wreck-big"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-big-2.png",
    default_status = "broken",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 150,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.8, -0.8}, {0.65, 0.65}},
    selection_box = {{-1.6, -1.6}, {1.3, 1.3}},
    drawing_box_vertical_extension = 0.4,
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-2-ground.png",
      priority="high",
      width = 450,
      height = 296,
      shift = util.by_pixel(-52, 8),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-2.png",
          width = 242,
          height = 258,
          shift = util.by_pixel(-13, -7),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-big-2-shadow.png",
          width = 294,
          height = 228,
          shift = util.by_pixel(27, -12),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[big2]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.001,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    },
  }, -- Spaceship Wreck Big 2
  {
    type = "simple-entity",
    name = "spaceship-wreck-medium-1",
    localised_name = {"entity-name.crash-site-spaceship-wreck-medium"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-1.png",
    default_status = "broken",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 100,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.6, -0.5}, {0.6, 0.35}},
    selection_box = {{-1.2, -1.0}, {1.2, 0.7}},
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1-ground.png",
      priority="high",
      width = 352,
      height = 206,
      shift = util.by_pixel(-41, 13),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1.png",
          width = 228,
          height = 120,
          shift = util.by_pixel(-14, -4),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1-shadow.png",
          width = 206,
          height = 114,
          shift = util.by_pixel(16, -1),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[medium1]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.001,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    },
  }, -- Spaceship Wreck Medium 1
  {
    type = "simple-entity",
    name = "spaceship-wreck-medium-2",
    localised_name = {"entity-name.crash-site-spaceship-wreck-medium"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-2.png",
    default_status = "broken",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 100,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.55, -0.3}, {0.5, 0.5}},
    selection_box = {{-1.1, -0.6}, {1.0, 1.0}},
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-2-ground.png",
      priority="high",
      width = 396,
      height = 214,
      shift = util.by_pixel(-56, -1),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-2.png",
          width = 194,
          height = 150,
          shift = util.by_pixel(-15, 8),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-2-shadow.png",
          width = 196,
          height = 114,
          shift = util.by_pixel(22, 15),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[medium2]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.001,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    },
  }, -- Spaceship Wreck Medium 2
  {
    type = "simple-entity",
    name = "spaceship-wreck-medium-3",
    localised_name = {"entity-name.crash-site-spaceship-wreck-medium"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-medium-3.png",
    default_status = "broken",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 100,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.4, -0.7}, {0.35, 0.7}},
    selection_box = {{-0.8, -1.4}, {0.7, 1.4}},
    dying_explosion = "big-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-3-ground.png",
      priority="high",
      width = 350,
      height = 284,
      shift = util.by_pixel(-44, 10),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-3.png",
          width = 224,
          height = 236,
          shift = util.by_pixel(-30, 4),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-3-shadow.png",
          width = 104,
          height = 178,
          shift = util.by_pixel(6, 0),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[medium3]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.001,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    },
  }, -- Spaceship Wreck Medium 3
  {
    type = "simple-entity",
    name = "spaceship-wreck-small-1",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-1.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    map_color = {r = 147, g = 58, b = 22, a = 1},
    count_as_rock_for_filtered_deconstruction = true,
    max_health = 50,
    impact_category = "metal",
    render_layer = "object",
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.5, -0.5}, {0.4, 0.4}},
    selection_box = {{-1.0, -1.0}, {0.8, 0.8}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-1-ground.png",
      priority="high",
      width = 240,
      height = 222,
      shift = util.by_pixel(-18, 12),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-1.png",
          width = 156,
          height = 152,
          shift = util.by_pixel(-9, -1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-1-shadow.png",
          width = 178,
          height = 122,
          shift = util.by_pixel(8, -3),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[small1]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.03,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    },
  }, -- Spaceship Wreck Small 1
  {
    type = "simple-entity",
    name = "spaceship-wreck-small-2",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-2.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 50,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.35, 0.0}, {0.35, 0.4}},
    selection_box = {{-0.7, 0.0}, {0.7, 0.8}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-2-ground.png",
      priority="high",
      width = 232,
      height = 154,
      shift = util.by_pixel(-14, 22),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-2.png",
          width = 146,
          height = 102,
          shift = util.by_pixel(-8, 16),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-2-shadow.png",
          width = 92,
          height = 76,
          shift = util.by_pixel(7, 19),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[small2]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.05,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    }
  }, -- Spaceship Wreck Small 2
  {
    type = "simple-entity",
    name = "spaceship-wreck-small-3",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-3.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    map_color = {r = 147, g = 58, b = 22, a = 1},
    count_as_rock_for_filtered_deconstruction = true,
    max_health = 50,
    impact_category = "metal",
    render_layer = "object",
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.35, -0.4}, {0.6, 0.3}},
    selection_box = {{-0.7, -0.8}, {1.2, 0.6}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-3-ground.png",
      priority="high",
      width = 274,
      height = 172,
      shift = util.by_pixel(-8, 3),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-3.png",
          width = 164,
          height = 148,
          shift = util.by_pixel(5, -1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-3-shadow.png",
          width = 156,
          height = 114,
          shift = util.by_pixel(9, -1),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[small3]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.2,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    }
  }, -- Spaceship Wreck Small 3
  {
    type = "simple-entity",
    name = "spaceship-wreck-small-4",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-4.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.45, -0.4}, {0.55, 0.3}},
    selection_box = {{-0.9, -0.8}, {1.1, 0.6}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-ground.png",
      priority="high",
      width = 256,
      height = 150,
      shift = util.by_pixel(-12, -2),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4.png",
          width = 168,
          height = 142,
          shift = util.by_pixel(1, -3),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-shadow.png",
          width = 164,
          height = 100,
          shift = util.by_pixel(19, -5),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[small4]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.02,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    }
  }, -- Spaceship Wreck Small 4
  {
    type = "simple-entity",
    name = "spaceship-wreck-small-5",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-5.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.4, -0.3}, {0.45, 0.1}},
    selection_box = {{-0.8, -0.6}, {0.9, 0.2}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5-ground.png",
      priority="high",
      width = 252,
      height = 128,
      shift = util.by_pixel(-15, -6),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5.png",
          width = 164,
          height = 120,
          shift = util.by_pixel(-6, -6),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5-shadow.png",
          width = 148,
          height = 78,
          shift = util.by_pixel(11, -10),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[small5]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.01,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    }
  }, -- Spaceship Wreck Small 5
  {
    type = "simple-entity",
    name = "spaceship-wreck-small-6",
    localised_name = {"entity-name.crash-site-spaceship-wreck-small"},
    icon = "__base__/graphics/icons/crash-site-spaceship-wreck-small-6.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    count_as_rock_for_filtered_deconstruction = true,
    impact_category = "metal",
    render_layer = "object",
    map_color = {r = 147, g = 58, b = 22, a = 1},
    max_health = 50,
    alert_when_damaged = false,
    allow_copy_paste = false,
    resistances =
    {
      {type = "fire", percent = 100}
    },
    minable =
    {
      mining_time = SCRAP_MINING_TIME
    },
    collision_box = {{-0.2, -0.1}, {0.75, 0.4}},
    selection_box = {{-0.4, -0.2}, {1.5, 0.8}},
    dying_explosion = "medium-explosion",
    integration_patch_render_layer = "decals",
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-6-ground.png",
      priority="high",
      width = 276,
      height = 160,
      shift = util.by_pixel(-8, 9),
      scale = 0.5
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-6.png",
          width = 166,
          height = 114,
          shift = util.by_pixel(10, 9),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-6-shadow.png",
          width = 160,
          height = 104,
          shift = util.by_pixel(27, 11),
          scale = 0.5,
          draw_as_shadow = true
        }
      }
    },
    autoplace =
    {
      control = "scraps",
      order = "a[doodad]-a[scrap]-c[small6]",
      probability_expression = "multiplier * control * (region_box + scrap_density - penalty)",
      local_expressions =
      {
        multiplier = 0.01,
        penalty = 0.1,
        region_box = "range_select_base(moisture, 0.35, 1, 0.2, -10, 0)",
        control = "control:scraps:size"
      }
    }
  } -- Spaceship Wreck Small 6
}

data.raw.planet.nauvis.map_gen_settings.autoplace_controls["scraps"] = {}


local wreck_names = {
  "spaceship-wreck-big-1", "spaceship-wreck-big-2",
  "spaceship-wreck-medium-1", "spaceship-wreck-medium-2",
  "spaceship-wreck-medium-3",
  "spaceship-wreck-small-1", "spaceship-wreck-small-2",
  "spaceship-wreck-small-3", "spaceship-wreck-small-4",
  "spaceship-wreck-small-5", "spaceship-wreck-small-6"
}

---@type table<string, LootItem>
local items = {}
local SCRAP_MULTIPLIER = settings.startup["scrap_multiplier"].value
if settings.startup["scrap_basic_items"].value then
  if lazyAPI.has_items_by_name("iron-scrap") then -- iron-scrap from https://github.com/SafTheLamb/fm-scrap-industry/blob/main/prototypes/item.lua
    items["iron-scrap"] = {count_min = 1}
  else
    items["iron-plate"]      = {count_min = 1, probability = 1/6}
    items["iron-stick"]      = {count_min = 1, probability = 1/6}
    items["iron-gear-wheel"] = {count_min = 1, probability = 1/6}
  end
  if lazyAPI.has_items_by_name("copper-scrap") then -- copper-scrap from https://github.com/SafTheLamb/fm-scrap-industry/blob/main/prototypes/item.lua
      items["copper-scrap"] = {count_min = 1}
  else
    items["copper-cable"] = {count_min = 1, probability = 1/6}
    items["copper-plate"] = {count_min = 1, probability = 1/6}
    -- items["copper-wire"]  = {count_min = 1, probability = 1/6}
  end
end

if settings.startup["scrap_steel_items"].value then
  if lazyAPI.has_items_by_name("steel-scrap") then -- steel-scrap from https://github.com/SafTheLamb/fm-scrap-industry/blob/main/prototypes/item.lua
    items["steel-scrap"] = {count_min = 1, probability = 1/6}
  else
    items["steel-plate"] = {count_min = 1, probability = 1/6}
  end
end

if settings.startup["scrap_circuit_items"].value then
  if lazyAPI.has_items_by_name("circuit-scrap") then -- circuit-scrap from https://github.com/SafTheLamb/fm-scrap-industry/blob/main/prototypes/item.lua
    items["circuit-scrap"] = {count_min = 1}
  else
    items["electronic-circuit"] = {count_min = 1, probability = 1/2}
  end
end

---@type table<string, LootItem>
scrap_data.items = lazyAPI.get_valid_items(items)
for name, loot in pairs(scrap_data.items) do
	loot.item = name
	lazyAPI.adapt_LootItem_for_ItemProduct(item)
end
---@cast scrap_data.items +table<string, ItemProduct>


local drop_chance = settings.startup["scrap_drop_chance_upon_destruction"].value / 100

---@param prototype table
---@param item LootItem|ItemProduct
function scrap_data.add_item_to_scrap(prototype, item)
	local item_name = (item.name or item.item)
	if item.item and not item.name then
		lazyAPI.adapt_LootItem_for_ItemProduct(item)
	end
	lazyAPI.EntityWithHealth.add_item_from_mining(prototype, item_name, item, SCRAP_MULTIPLIER)

	local amount_max = (item.count_max or item.amount_max)
	amount_max = amount_max and amount_max * SCRAP_MULTIPLIER
	local amount_min = (item.amount or item.count_min or item.amount_min)
	amount_min = amount_min and amount_min* SCRAP_MULTIPLIER
	if amount_max and amount_max < amount_min then
		amount_max = amount_min
	end

	if drop_chance > 0 then
		lazyAPI.loot.set(
			prototype, item_name,
			amount_min, amount_max,
			(item.probability or 1) * drop_chance
		)
	end
end

for _, entity_name in pairs(wreck_names) do
  for _, item in pairs(scrap_data.items) do
    local prototype = data.raw["simple-entity"][entity_name]
		scrap_data.add_item_to_scrap(prototype, item)
  end
end
