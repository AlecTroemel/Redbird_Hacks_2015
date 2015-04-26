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
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = "1"
          }
        },
        {
          id = 1,
          properties = {
            ["collidable"] = "1"
          }
        },
        {
          id = 2,
          properties = {
            ["collidable"] = "1"
          }
        },
        {
          id = 8,
          properties = {
            ["collidable"] = "1"
          }
        },
        {
          id = 9,
          properties = {
            ["collidable"] = "1"
          }
        },
        {
          id = 10,
          properties = {
            ["collidable"] = "1"
          }
        }
      }
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
        ["collidable"] = "1"
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 42, 42, 42, 42, 42, 42, 42, 42, 0,
        42, 42, 42, 42, 42, 42, 42, 42, 42, 0,
        1, 2, 2, 2, 2, 2, 2, 2, 2, 3,
        9, 10, 10, 10, 10, 10, 10, 10, 10, 11
      }
    },
    {
      type = "tilelayer",
      name = "forground",
      x = 0,
      y = 0,
      width = 10,
      height = 5,
      visible = true,
      opacity = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 6, 7, 8, 0, 0, 0,
        0, 0, 0, 0, 14, 15, 16, 0, 0, 0,
        7, 8, 0, 0, 0, 5, 0, 32, 32, 32,
        0, 12, 0, 0, 0, 0, 0, 0, 0, 4,
        0, 0, 0, 0, 13, 4, 0, 13, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "collision",
      visible = true,
      opacity = 1,
      properties = {
        ["Collidable"] = "true"
      },
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0.333333,
          y = 72.3333,
          width = 238.667,
          height = 47.6667,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
