# Qute browser config

# Do not load config from auto-config.yml
config.load_autoconfig(False)

# Cookies config
config.set('content.cookies.accept', 'no-unknown-3rdparty', 'chrome-devtools://*')
config.set('content.cookies.accept', 'no-unknown-3rdparty', 'devtools://*')

# Load images automatically in web pages
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Search
c.url.searchengines = {
        'DEFAULT': 'https://google.com/search?q={}',
        'stack': 'https://stackoverflow.com/search?q={}'
        }

# Start page
c.url.start_pages = ['https://google.com']

# Dark mode
c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-hsl'
c.colors.webpage.darkmode.grayscale.all = True
c.colors.webpage.darkmode.contrast = 0.35

# Key binds
config.bind('<Ctrl-m>', 'open qute://bookmarks/')
config.bind('<Ctrl-=>', 'bookmark-add')
config.bind('<Ctrl-Shift-=', 'bookmark-del')

# Font theme
primary_font   = 'Sans'
secundary_font = 'Hack'

c.fonts.default_family = primary_font
c.fonts.default_size = "10pt"
c.fonts.completion.entry = f'11pt "{secundary_font}"'
c.fonts.debug_console = f'11pt "{secundary_font}"'
c.fonts.prompts = f'11pt "{secundary_font}"'
c.fonts.statusbar = f'11pt "{secundary_font}"'

# Color theme
primary_main_color   = '#85A4F3'
secundary_main_color = '#8D91F6'
primary_bg_color     = '#1A1919'
secundary_bg_color   = '#454343'
primary_fg_color     = '#E7E1E1'
secundary_fg_color   = '#CAC5C5'

c.colors.completion.fg = secundary_fg_color
c.colors.completion.odd.bg = primary_bg_color
c.colors.completion.even.bg = primary_bg_color
c.colors.completion.category.fg = primary_main_color
c.colors.completion.category.bg = primary_bg_color
c.colors.completion.item.selected.bg = secundary_bg_color
c.colors.completion.item.selected.fg = primary_fg_color
c.colors.completion.item.selected.border.bottom = secundary_bg_color
c.colors.completion.item.selected.border.top = secundary_bg_color
c.colors.hints.fg = primary_fg_color
c.colors.hints.bg = secundary_bg_color
c.colors.hints.match.fg = primary_bg_color
c.colors.messages.info.bg = primary_bg_color
c.colors.statusbar.normal.bg = primary_bg_color
c.colors.statusbar.insert.fg = primary_main_color
c.colors.statusbar.insert.bg = primary_bg_color
c.colors.statusbar.passthrough.bg = secundary_main_color
c.colors.statusbar.command.bg = primary_bg_color
c.colors.statusbar.url.warn.fg = secundary_bg_color
c.colors.tabs.bar.bg = primary_bg_color
c.colors.tabs.odd.bg = primary_bg_color
c.colors.tabs.even.bg = primary_bg_color
c.colors.tabs.selected.odd.bg = primary_bg_color
c.colors.tabs.selected.even.bg = primary_bg_color
c.colors.tabs.pinned.odd.bg = primary_bg_color
c.colors.tabs.pinned.even.bg = primary_bg_color
c.colors.tabs.pinned.selected.odd.bg = primary_bg_color
c.colors.tabs.pinned.selected.even.bg = primary_bg_color
