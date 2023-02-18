-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
--[[ require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'iceberg_dark',
        section_separators = { left = '', right = ''},
        disabled_filetypes = {'NvimTree'}
    },
    sections = {

        lualine_a = {
            {
                ""
            }
        },
        lualine_a = {
            {
                ""
            }
        },

        lualine_c = {
            {
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                -- newfile_status = false, -- Display new file status (new file means no write after created)
                path = 1, -- 0: Just the filename
                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                color = 'dark',
            }
        },
        lualine_x = {
            {
                'filetype',
            }
        },
        lualine_z = {
            {
                ""
            }
        }
    },
    inactive_sections = {

        lualine_c = {
            {
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                -- newfile_status = false, -- Display new file status (new file means no write after created)
                path = 1, -- 0: Just the filename
                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            }
        }
    }
}) ]]
