require("todo-comments").setup {
    signs = false, -- show icons in the signs column
    sign_priority = 8, -- sign priority

    keywords = {
        FIX = { icon = "", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
        DEPRECATED = { icon = "", color = "error", alt = { "DEPR", "UNUSED", "DEAD CODE" } },
        WAIT = { icon = "", color = "wait_color", alt = { "UPCOMING", "LOW PRIORITY" } },
        TODO = { icon = "", color = "info" },
        HACK = { icon = "", color = "warning" },
        WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO", "NEW" } },
        TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        TEMP = { icon = "", color = "temporary", alt = { "TEMPORARY" } }
    },

    gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
    },

    merge_keywords = true, 
    highlight = {
        multiline = false, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "fg",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
    },

    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
        wait_color = { "#FF47A1" },
        temporary = { "#CD00FA" },
    },

    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        pattern = [[\b(KEYWORDS):]],
    },
}
