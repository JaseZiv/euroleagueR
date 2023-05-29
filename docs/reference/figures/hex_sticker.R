


library(hexSticker)


sysfonts::font_add_google(name = "Courier", family = "Courier")
sysfonts::font_add(family = "Courier", regular = "Courier.ttc")

sysfonts::font.paths() |> View()
sysfonts::font_files() |> View()

sticker(subplot = "man/figures/euroleagueR_image2.png",
        package="euroleagueR",
        p_family = "Courier", p_size=6, p_color = "steelblue", p_y = 1.4,
        s_x=1, s_y=.75, s_width=0.4, s_height=0.4,
        dpi = 1000,
        h_fill = "lightyellow", h_color = "steelblue",
        spotlight = TRUE, l_alpha = 0.25, l_x = 0.3, l_y = 0.55,
        url = "https://jaseziv.github.io/euroleagueR/", u_y = 0.07, u_x = 1.0, u_size = 1, u_color = "steelblue", u_family = "Courier",
        filename="man/figures/logo.png")
