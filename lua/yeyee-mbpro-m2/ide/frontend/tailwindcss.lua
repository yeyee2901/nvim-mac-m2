local M = {}

M.update_on_attach = function(on_attach)
	return function(client, bufnr)
		if client.server_capabilities.colorProvider then
			require("colorizer").attach_to_buffer({
				bufnr,
				{
					mode = "background",
					css = true,
					names = false,
					tailwind = false,
				},
			})		
		end

		-- call the default
		on_attach(client, bufnr)
	end
end

M.get_settings = function()
	return {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			experimental = {
				classRegex = {
					"tw`([^`]*)",
					'tw="([^"]*)',
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "classnames\\(([^)]*)\\)", "'([^']*)'" },
					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		}
	}
end

return M
