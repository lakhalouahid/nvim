vim.o.completeopt = 'menuone,noselect'
require("luasnip.loaders.from_snipmate").load({ path = "~/.local/share/nvim/vim-snippets" }) -- opts can be ommited

-- luasnip setup
local luasnip = require 'luasnip'
luasnip.filetype_extend("javascript", {"javascriptreact"})
luasnip.filetype_extend("javascript", {"html"})

local nvim_lsp = require('lspconfig')
local util = require("lspconfig/util")
local lsp_extensions = require('lsp_extensions')
local nvim_autopairs = require("nvim-autopairs")
local cmp = require('cmp')


local root_pattern = nvim_lsp.util.root_pattern
lsp_extensions.inlay_hints{ enabled = {"ChainingHint", "TypeHint", "ParameterHint"} } 

--[[ -- status lsp
local lsp_status = require('lsp-status')
lsp_status.register_progress() ]]

-- nvim-cmp setup

nvim_autopairs.setup({})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'emoji' },
        { name = 'luasnip' },
        { name = 'path' },
    },
});

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true




-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    client.server_capabilities.document_formatting = true
    -- lsp_status.on_attach(client)

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gdd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gds', '<cmd>sp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gdv', '<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gdt', '<cmd>tabnew<CR><cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)
    buf_set_keymap('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>ql', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>qf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
nvim_lsp.lua_ls.setup {
    autostart = true,
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

nvim_lsp.clangd.setup {
    autostart = true,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = root_pattern(          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'),
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}

nvim_lsp.pyright.setup {
    autostart = true,
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

nvim_lsp.tsserver.setup {
    autostart = true,
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

nvim_lsp.ltex.setup {
    cmd = { "ltex-ls" },
    filetypes = { "tex", "markdown" },
    autostart = true,
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}
nvim_lsp.gopls.setup {
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}

function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
        end
    end
end

nvim_lsp.cssls.setup {
    filetypes = { "css", "scss", "less" },
    autostart = true,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}
nvim_lsp.html.setup {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    autostart = true,
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}
nvim_lsp.texlab.setup {
    cmd = { "texlab" },
    filetypes = { "tex" },
    autostart = true,
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}


--[[ nvim_lsp.grammarly.setup {
    cmd = { "grammarly-languageserver", "--stdio" },
    filetypes = { "markdown" },
    autostart = false,
    init_options = {
        formatting = true,
        clientId = "client_MaxHzbZJTiCTgHvSbu11Rv"
    },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
} ]]

---- vim.o.statusline = "%!luaeval(\"require('lps-status').status()\")"


nvim_lsp.rust_analyzer.setup({
    filetypes = { "rust" },
    autostart = true,
    init_options = { formatting = true },
    capabilities = capabilities,
    on_attach = on_attach,
})

