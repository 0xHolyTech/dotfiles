local util = require('lspconfig.util')

return {
    cmd = { 'typescript-language-server', '--stdio' },
    root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'typescript.jsx', 'javascript.jsx' },
}
