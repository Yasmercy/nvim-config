vim.cmd([[
  function! VimwikiLinkHandler(link)
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
      let link_infos = vimwiki#base#resolve_link(link)
      if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
      else
        exe 'tabnew ' . fnameescape(link_infos.filename)
        return 1
      endif
    elseif link =~# 'file:'
      let link_infos = vimwiki#base#resolve_link(link)
      if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!'
        return 0
      else
        exe '!wslview' fnameescape(link_infos.filename)
        return 1
      endif
    return 0
    endif
  endfunction
]])
