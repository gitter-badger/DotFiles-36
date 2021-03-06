scriptencoding utf-8
call unite#custom#source('codesearch', 'max_candidates', 30)
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
            \   'safe': 0,
            \   'start_insert': 1,
            \   'short_source_names': 1,
            \   'update_time': 200,
            \   'direction': 'rightbelow',
            \   'winwidth': 40,
            \   'winheight': 15,
            \   'max_candidates': 100,
            \   'no_auto_resize': 1,
            \   'vertical_preview': 1,
            \   'cursor_line_time': '0.10',
            \   'hide_icon': 0,
            \   'candidate-icon': ' ',
            \   'marked_icon': '✓',
            \   'prompt' : ' ➭'
            \ })
call unite#custom#profile('source/neobundle/update', 'context', {
            \   'start_insert' : 0,
            \ })
let g:unite_source_codesearch_ignore_case = 1
let g:unite_source_buffer_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_directory_mru_limit = 80
let g:unite_source_file_rec_max_depth = 6
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_data_directory='~/.cache/unite'
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_split_rule = 'botright'
let g:unite_winheight=25
let g:unite_source_grep_default_opts = "-iRHn"
            \ . " --exclude='tags'"
            \ . " --exclude='cscope*'"
            \ . " --exclude='*.svn*'"
            \ . " --exclude='*.log*'"
            \ . " --exclude='*tmp*'"
            \ . " --exclude-dir='**/tmp'"
            \ . " --exclude-dir='CVS'"
            \ . " --exclude-dir='.svn'"
            \ . " --exclude-dir='.git'"
            \ . " --exclude-dir='node_modules'"
let g:unite_launch_apps = [
            \ 'rake',
            \ 'make',
            \ 'git pull',
            \ 'git push']
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {
            \ 'description' : '            gestionar repositorios git
            \                            ⌘ [espacio]g',
            \}
let g:unite_source_menu_menus.git.command_candidates = [
            \['▷ tig                                                        ⌘ ,gt',
            \'normal ,gt'],
            \['▷ git status       (Fugitive)                                ⌘ ,gs',
            \'Gstatus'],
            \['▷ git diff         (Fugitive)                                ⌘ ,gd',
            \'Gdiff'],
            \['▷ git commit       (Fugitive)                                ⌘ ,gc',
            \'Gcommit'],
            \['▷ git log          (Fugitive)                                ⌘ ,gl',
            \'exe "silent Glog | Unite quickfix"'],
            \['▷ git blame        (Fugitive)                                ⌘ ,gb',
            \'Gblame'],
            \['▷ git stage        (Fugitive)                                ⌘ ,gw',
            \'Gwrite'],
            \['▷ git checkout     (Fugitive)                                ⌘ ,go',
            \'Gread'],
            \['▷ git rm           (Fugitive)                                ⌘ ,gr',
            \'Gremove'],
            \['▷ git mv           (Fugitive)                                ⌘ ,gm',
            \'exe "Gmove " input("destino: ")'],
            \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
            \'Git! push'],
            \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
            \'Git! pull'],
            \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
            \'exe "Git! " input("comando git: ")'],
            \['▷ git cd           (Fugitive)',
            \'Gcd'],
            \]
let g:unite_source_grep_max_candidates = 200
if executable('hw')
    " Use hw (highway)
    " https://github.com/tkengo/highway
    let g:unite_source_grep_command = 'hw'
    let g:unite_source_grep_default_opts = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt (the platinum searcher)
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack
    " http://beyondgrep.com/
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " Use jvgrep
    " https://github.com/mattn/jvgrep
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
endif
let g:unite_source_rec_async_command =
            \ ['ag', '--follow', '--nocolor', '--nogroup',
            \  '--hidden', '-g', '']
nnoremap <silent><leader>ufa :<C-u>Unite -no-split -buffer-name=Mixed -start-insert file file_mru file_rec buffer<cr>
nnoremap <silent><leader>ufr :<C-u>Unite -buffer-name=files file_rec/async:!<cr>
nnoremap <silent><leader>ufg :<C-u>Unite -buffer-name=git-repo file_rec/git<cr>
call unite#custom#profile('file_rec/async,file_rec/git', 'context', {
            \   'start_insert' : 1,
            \   'quit'         : 1,
            \   'split'        : 1,
            \   'keep_focus'   : 1,
            \   'winheight'    : 20,
            \ })
call unite#custom#source('file_rec/async', 'ignore_globs',['*.png','.git/','*.ttf'])
nnoremap <silent><leader>uf  :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <silent><leader>ufm :<C-u>Unite -no-split -buffer-name=mru   -start-insert file_mru<cr>
nnoremap <silent><leader>ubf :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <silent><leader>utb :<C-u>Unite -buffer-name=buffer_tab  buffer_tab<cr>
call unite#custom#profile('buffer,buffer_tab', 'context', {
            \   'start_insert' : 0,
            \   'quit'         : 1,
            \   'keep_focus'   : 1,
            \ })
nnoremap <silent><leader>um  :<C-u>Unite -start-insert mapping<CR>
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
"" Tag search
""" For searching the word in the cursor in tag file
nnoremap <silent><leader>f :<c-u>Unite tag/include:<C-R><C-w><CR>
nnoremap <silent><leader>ff :<c-u>Unite tag/include -start-insert<CR>
"" grep dictionay
""" For searching the word in the cursor in the current directory
nnoremap <silent><leader>v :Unite -auto-preview -no-split grep:.::<C-R><C-w><CR>
nnoremap <space>/ :Unite -auto-preview grep:.<cr>
""" For searching the word handin
nnoremap <silent><leader>vs :Unite -auto-preview -no-split grep:.<CR>
""" For searching the word in the cursor in the current buffer
noremap <silent><leader>vf :Unite -auto-preview -no-split grep:%::<C-r><C-w><CR>
""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>va :Unite -auto-preview -no-split grep:$buffers::<C-r><C-w><CR>
nnoremap <silent><Leader>bl :<C-u>Unite -start-insert -buffer-name=buffer buffer<cr>
"" outline
nnoremap <silent><leader>o :<C-u>Unite -buffer-name=outline -start-insert -auto-preview -no-split outline<cr>
"" Line search
nnoremap <silent><leader>l :Unite line -start-insert  -auto-preview -no-split<CR>
"" Yank history
nnoremap <silent><leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
" search plugin
" :Unite neobundle/search
"for Unite menu{
nnoremap <silent><leader>ug :Unite -silent -start-insert menu:git<CR>
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]
nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
            \ -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
            \ -buffer-name=files -prompt=%\  buffer bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
            \ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]s  :<C-u>Unite session<CR>
nnoremap <silent> [unite]n  :<C-u>Unite session/new<CR>
nnoremap <silent> [unite]fr
            \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma
            \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
            \ :<C-u>Unite output:message<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> [unite]w
            \ :<C-u>Unite -buffer-name=files -no-split
            \ jump_point file_point buffer_tab
            \ file_rec:! file file/new<CR>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.

    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-n>   <Plug>(unite_select_next_line)
    nmap <buffer> <C-n>   <Plug>(unite_select_next_line)
    imap <buffer> <C-p>   <Plug>(unite_select_previous_line)
    nmap <buffer> <C-p>   <Plug>(unite_select_previous_line)


    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    imap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction


let g:unite_source_menu_menus.CustomKeyMaps = {'description': 'Custom mapped keyboard shortcuts                   |<SPACE>'}
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates = [
    \['➤ Buffer list                                                   <Leader>bl', 'Unite buffer'],
    \['➤ Delete from buffer list in normal mode                        <C-d>', 'echo "Use <C-d> to delete a buffer"'],
    \['➤ Find files                                                    <Leader>ff', 'normal <Leader>ff'],
    \['➤ Search jumps                                                  <Leader>sj', 'Unite jump'],
    \['➤ Search lines in the current buffer                            <Leader>sb', 'Unite line'],
    \['➤ Update Vim plugins                                            <Leader>vu', 'normal <Leader>vu'],
    \['➤ Grep in Quickfix buffer                                       <Leader>g', 'echo "Use <Leader>g to grep within the Quickfix buffer"'],
    \['➤ Restore the Quickfix buffer                                   <Leader>r', 'echo "Use <Leader>r to restore the Quickfix buffer"'],
    \['➤ Reverse Grep in Quickfix buffer                               <Leader>v', 'echo "Use <Leader>v to reverse grep within the Quickfix buffer"'],
    \['➤ Reverse Grep Line Under Cursor in Quickfix buffer             <Leader>d', 'echo "Use <Leader>d to reverse grep the Line Under the Cursor in Quickfix buffer"'],
    \]
nnoremap <silent>[unite]<Space> :Unite -silent -winheight=17 -start-insert menu:CustomKeyMaps<CR>
