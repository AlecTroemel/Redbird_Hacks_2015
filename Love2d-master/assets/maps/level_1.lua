return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.11.0",
  orientation = "orthogonal",
  width = 10,
  height = 5,
  tilewidth = 24,
  tileheight = 24,
  nextobjectid = 10,
  properties = {},
  tilesets = {
    {
      name = "forest",
      firstgid = 1,
      tilewidth = 24,
      tileheight = 24,
      spacing = 0,
      margin = 0,
      image = "../forest tileset.png",
      imagewidth = 192,
      imageheight = 144,
      transparentcolor = "#ffffff",
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "background",
      x = 0,
      y = 0,
      width = 10,
      height = 5,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        44, 44, 44, 44, 44, 44, 44, 44, 44, 44,
        44, 44, 44, 44, 44, 44, 44, 44, 44, 44,
        44, 44, 44, 44, 44, 44, 44, 44, 44, 44,
        44, 44, 44, 44, 44, 44, 44, 44, 44, 44,
        44, 44, 44, 44, 44, 44, 44, 44, 44, 44
      }
    },
    {
      type = "tilelayer",
      name = "floor",
      x = 0,
      y = 0,
      width = 10,
      height = 5,
      visible = true,
      opacity = 1,
      properties = {
        ["collidable"] = "true"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 2, 2, 3, 0, 0, 1, 2, 2, 3,
        9, 10, 10, 11, 0, 0, 9, 10, 10, 11
      }
    },
    {
      type = "tilelayer",
      name = "forground",
      x = 0,
      y = 0,
      width = 10,
      height = 5,
      visible = false,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 43, 43, 43, 43, 43, 43, 43,
        43, 43, 43, 43, 43, 43, 43, 43, 43, 43,
        43, 43, 43, 43, 43, 43, 43, 43, 43, 43
      }
    }
  }
}
