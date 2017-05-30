# Add colours in the file and save the binary file as "/R/sysdata.rdata"
# 1. EE colours
ee_hex_cols <- c(
  aqua              = '#009C9C',
  yellow            = '#FFE600',
  coral             = '#F3666B',
  green             = '#007B85',
  purple            = '#654B8F',
  lime              = '#D6E03D',
  grey              = '#6D6E71',
  ivory             = '#F6F4F0',
  torquoise         = '#6DCED0',
  charcol           = '#3c3d40',
  background_grey   = '#f6f4f0',
  background_green  = '#009C9C',
  font_normal       = '#6d6e71',
  font_yellow       = '#ffe600',
  font_red          = '#F3666B')

# 2. Wipro colours
# from https://wipro365-my.sharepoint.com/personal/scshekar_wipro_com/Documents/Analytics%20-%20Overview%20-%202017.pptx?web=1
wipro_rgb_cols <- list(
  blue              = c( 14,  53, 112),
  grey              = c(100,  99,  99),
  green             = c(109, 194,  75),
  yellow            = c(255, 218,  41),
  red               = c(239,  51,  65),
  cyan              = c(  0, 162, 224),
  dark_1            = c(  0,   0,   0),
  light_1           = c(255, 255, 255),
  dark_2            = c( 14,  53, 112),
  light_2           = c(242, 242, 242))

# Collect all palettes in a list
xlPalettes <- list(
  ee = ee_hex_cols,
  wipro = wipro_rgb_cols)

# Save the file as sysadta.rda in /R
devtools::use_data(xlPalettes, internal = T)
