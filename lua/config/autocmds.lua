--  See `:help lua-guide-autocommands`
--Nvum tree auto close
-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree_1" then
--             vim.cmd("quit")
--         end
--     end,
-- })

-- require("base46").load_all_highlights()

-- Función para saltar al n-ésimo buffer en la lista
local function goto_nth_buffer(n)
    -- Obtener buffers válidos (cargados y listados)
    local valid_buffers = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted and vim.fn.buflisted(buf) == 1 then
            table.insert(valid_buffers, buf)
        end
    end

    -- Ordenar por ID de buffer
    table.sort(valid_buffers)

    -- Saltar al buffer en posición n
    if valid_buffers[n] then
        vim.api.nvim_set_current_buf(valid_buffers[n])
    else
        print("Buffer #" .. n .. " no disponible")
    end
end

-- Crear autocomandos para los atajos
for i = 1, 9 do
    vim.keymap.set("n", "<A-" .. i .. ">", function()
        goto_nth_buffer(i)
    end, { desc = "Ir al buffer " .. i })
end

-- Atajo para el décimo buffer (Alt+0)
-- vim.keymap.set('n', '<A-0>', function()
--     goto_nth_buffer(10)
-- end, {desc = "Ir al buffer 10"})
-- Buffers in numeral 1-9
-- for i = 1, 9, 1 do
--     vim.keymap.set("n", string.format("<A-%s>", i), function()
--         vim.api.nvim_set_current_buf(vim.t.bufs[i])
--     end)
-- end
-- Highlight when yanking (copying) text
-- highlight when yank text

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

--LspProgress
--
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
            return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
                p[i] = {
                    token = ev.data.params.token,
                    msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                    ),
                    done = value.kind == "end",
                }
                break
            end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and " " or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})

-- close some filetypes with <q>

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "grug-far",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
        "dbout",
        "gitsigns.blame",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", {
            buffer = event.buf,
            silent = true,
            desc = "Quit buffer",
        })
    end,
})
