vim.keymap.set("n", "<C-e>", ":!pandoc %:p --output=%:t:r.pdf --pdf-engine=wkhtmltopdf<CR>:!open %:t:r.pdf<CR><CR>", {buffer = true})
