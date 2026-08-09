return {
  "HakonHarnes/img-clip.nvim",
  event = "FileType markdown",
  dependencies = {
    "vhyrro/luarocks.nvim",
  },
  opts = {
    use_imagemagick = true,
    imagemagick_cmd = "magick",
    allowed_file_types = { "webp", "png", "jpg", "jpeg", "gif", "bmp", "tiff", "avif" },
    default_file_type = "webp",
    quality = 75,
  },
}
