local M = {}

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filter_typescript_definition_files(value)
	-- Depending on typescript version either uri or targetUri is returned
	if value.uri then
		return string.match(value.uri, "%.d.ts") == nil
	elseif value.targetUri then
		return string.match(value.targetUri, "%.d.ts") == nil
	end
end

M.get_capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities_updated = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities.snippetSupport = true
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	capabilities.textDocument.codeAction = {
		dynamicRegistration = false,
		codeActionLiteralSupport = {
			codeActionKind = {
				valueSet = {
					"",
					"quickfix",
					"refactor",
					"refactor.extract",
					"refactor.inline",
					"refactor.rewrite",
					"source",
					"source.organizeImports",
				},
			},
		},
	}

	return capabilities
end

M.get_handlers = function()
	return {
		-- add definition dari definition files (.d.ts files)
		["textDocument/definition"] = function(err, result, method, ...)
			if vim.tbl_islist(result) and #result > 1 then
				local filtered_result = filter(result, filter_typescript_definition_files)
				return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
			end

			vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
		end,
	}
end

M.get_settings = function()
	return {
		typescript = {
			suggest = {
				includeCompletionsForModuleExports = true,
			},
		},
		javascript = {
			suggest = {
				includeCompletionsForModuleExports = true,
			},
		},
	}
end

return M
