[theme]
custom_palette = "anonymousrand"
source = "custom"

[theme.templates]
builtin_ids = ["kitty"]
enable_builtin_templates = true

[theme.templates.custom_colors.comments]
color_dark = "#ff0000"
color_light = "#ffa200"

[theme.templates.user.fish]
input_path = "/home/user/meow/.config/noctalia/templates/fish.fish"
output_path = "$XDG_CONFIG_HOME/fish/noctalia_theme.fish"
post_hook = "source $HOME/.config/fish/config.fish"
