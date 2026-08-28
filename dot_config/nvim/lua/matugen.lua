local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#0f1724", -- Default Background
    base01 = "#1f2f47", -- Lighter Background (status bars)
    base02 = "#1c2a40", -- Selection Background
    base03 = "#5f6874", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb2b6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#f1b55a", -- Integers, Constants
    base0A = "#675cd6", -- Classes, Search Background
    base0B = "#e1ec7a", -- Strings, Diff Inserted
    base0C = "#a7e581", -- Regex, Escape Chars
    base0D = "#a466cc", -- Functions, Methods
    base0E = "#6799e4", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
  })
end
--[[
primary: #6799e4
on_primary: #050608
primary_container: #0c3f8d
on_primary_container: #dbe3f0
primary_fixed: #bed3f4
primary_fixed_dim: #93b6ec
on_primary_fixed: #21252c
on_primary_fixed_variant: #2b313b

secondary: #675cd6
on_secondary: #181d25
secondary_container: #19106f
on_secondary_container: #dddbf0
secondary_fixed: #c3bef4
secondary_fixed_dim: #9d96e9
on_secondary_fixed: #22212c
on_secondary_fixed_variant: #2d2b3b

tertiary: #a466cc
on_tertiary: #181d25
tertiary_container: #491669
on_tertiary_container: #e8dbf0
tertiary_fixed: #dfbef4
tertiary_fixed_dim: #c896e9
on_tertiary_fixed: #27212c
on_tertiary_fixed_variant: #352b3b

error: #fd4663
on_error: #181d25
error_container: #900017
on_error_container: #fecdd4

surface: #121c2b
on_surface: #f2f2f3
surface_variant: #192539
on_surface_variant: #afb2b6
surface_dim: #0c131c
surface_bright: #253855
surface_container_lowest: #090e15
surface_container_low: #0f1724
surface_container: #1f2f47
surface_container_high: #1c2a40
surface_container_highest: #22334e

outline: #5f6874
outline_variant: #5f6874
shadow: #121c2b
scrim: #000000

inverse_surface: #e3e5e8
inverse_on_surface: #242628
inverse_primary: #335b99

background: #121c2b
on_background: #f2f2f3

hued: #e4cf67
invert: #98661b
invert: #98a329
invert: #5b9933
--]]
-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
