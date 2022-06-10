vim.api.nvim_command([[
augroup lsp_aucmds
au! * <buffer>
au User LspDiagnosticsChanged redrawstatus!
au User LspMessageUpdate redrawstatus!
au User LspStatusUpdate redrawstatus!
augroup END
]])
