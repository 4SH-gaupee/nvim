lua -- Set indentation to 2 spaces 
augroup('setIndent', { clear = true }) 
autocmd('Filetype', { 
    group = 'setIndent', 
    pattern = { 
        'css', 
        'html', 
        'javascript', 
        'lua', 
        'markdown', 
        'md', 
        'typescript', 
        'scss', 
        'xml', 
        'xhtml', 
        'yaml' 
    }, 
    command = 'setlocal shiftwidth=2 tabstop=2' 
}) 
