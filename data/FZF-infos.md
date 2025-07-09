---- FZF kbd shortcuts ------

abort                        ctrl-c  ctrl-g  ctrl-q  esc
accept                       enter   double-click

backward-char                ctrl-b  left
backward-delete-char         ctrl-h  bspace
backward-kill-word           alt-bs
backward-word                alt-b   shift-left
beginning-of-line            ctrl-a  home
clear-screen                 ctrl-l
delete-char                  del
delete-char/eof              ctrl-d (same as delete-char except aborts fzf if query is empty)
end-of-line                  ctrl-e  end
forward-char                 ctrl-f  right
forward-word                 alt-f   shift-right
kill-word                    alt-d     **
unix-line-discard            ctrl-u
unix-word-rubout             ctrl-w
yank                         ctrl-y

page-up                      pgup
up                           ctrl-k  ctrl-p  up
down                         ctrl-j  ctrl-n  down
page-down                    pgdn

toggle                       (right-click)
toggle-wrap                  ctrl-/  alt-/
toggle+down                  ctrl-i  (tab)
toggle+up                    btab    (shift-tab)

preview-down                 shift-down
preview-up                   shift-up

---- vibs kbd shortcuts -----

select all                   alt-a
deselect all                 alt-d   **
vimdiff SUMMARY.ms's         alt-s
list of rft files            alt-r
list of translated files     alt-t
abort                        left
accept                       right

====================================================================================


abort                        ctrl-c  ctrl-g  ctrl-q  esc
accept                       enter   double-click
accept-non-empty             (same as accept except that it prevents fzf from exiting without selection)
accept-or-print-query        (same as accept except that it prints the query when there's no match)
backward-char                ctrl-b  left
backward-delete-char         ctrl-h  bspace
backward-delete-char/eof     (same as backward-delete-char except aborts fzf if query is empty)
backward-kill-word           alt-bs
backward-word                alt-b   shift-left
become(...)                  (replace fzf process with the specified command; see below for the details)
beginning-of-line            ctrl-a  home
bell                         (ring the terminal bell)
cancel                       (clear query string if not empty, abort fzf otherwise)
change-border-label(...)     (change --border-label to the given string)
change-ghost(...)            (change ghost text to the given string)
change-header(...)           (change header to the given string; doesn't affect --header-lines)
change-header-label(...)     (change --header-label to the given string)
change-input-label(...)      (change --input-label to the given string)
change-list-label(...)       (change --list-label to the given string)
change-multi                 (enable multi-select mode with no limit)
change-multi(...)            (enable multi-select mode with a limit or disable it with 0)
change-nth(...)              (change --nth option; rotate through the multiple options separated by '|')
change-pointer(...)          (change --pointer option)
change-preview(...)          (change --preview option)
change-preview-label(...)    (change --preview-label to the given string)
change-preview-window(...)   (change --preview-window option; rotate through the multiple option sets separated by '|')
change-prompt(...)           (change prompt to the given string)
change-query(...)            (change query string to the given string)
clear-screen                 ctrl-l
clear-selection              (clear multi-selection)
close                        (close preview window if open, abort fzf otherwise)
clear-query                  (clear query string)
delete-char                  del
delete-char/eof              ctrl-d (same as delete-char except aborts fzf if query is empty)
deselect
deselect-all                 (deselect all matches)
disable-search               (disable search functionality)
down                         ctrl-j  ctrl-n  down
enable-search                (enable search functionality)
end-of-line                  ctrl-e  end
exclude                      (exclude the current item from the result)
exclude-multi                (exclude the selected items or the current item from the result)
execute(...)                 (see below for the details)
execute-silent(...)          (see below for the details)
first                        (move to the first match; same as pos(1))
forward-char                 ctrl-f  right
forward-word                 alt-f   shift-right
ignore
jump                         (EasyMotion-like 2-keystroke movement)
kill-line
kill-word                    alt-d
last                         (move to the last match; same as pos(-1))
next-history                 (ctrl-n on --history)
next-selected                (move to the next selected item)
page-down                    pgdn
page-up                      pgup
half-page-down
half-page-up
hide-header
hide-input
hide-preview
offset-down                  (similar to CTRL-E of Vim)
offset-up                    (similar to CTRL-Y of Vim)
offset-middle                (place the current item is in the middle of the screen)
pos(...)                     (move cursor to the numeric position; negative number to count from the end)
prev-history                 (ctrl-p on --history)
prev-selected                (move to the previous selected item)
preview(...)                 (see below for the details)
preview-down                 shift-down
preview-up                   shift-up
preview-page-down
preview-page-up
preview-half-page-down
preview-half-page-up
preview-bottom
preview-top
print(...)                   (add string to the output queue and print on normal exit)
put                          (put the character to the prompt)
put(...)                     (put the given string to the prompt)
refresh-preview
rebind(...)                  (rebind bindings after unbind)
reload(...)                  (see below for the details)
reload-sync(...)             (see below for the details)
replace-query                (replace query string with the current selection)
search(...)                  (trigger fzf search with the given string)
select
select-all                   (select all matches)
show-header
show-input
show-preview
toggle                       (right-click)
toggle-all                   (toggle all matches)
toggle-in                    (--layout=reverse* ? toggle+up : toggle+down)
toggle-out                   (--layout=reverse* ? toggle+down : toggle+up)
toggle-bind
toggle-header
toggle-hscroll
toggle-input
toggle-multi-line
toggle-preview
toggle-preview-wrap
toggle-search                (toggle search functionality)
toggle-sort
toggle-track                 (toggle global tracking option (--track))
toggle-track-current         (toggle tracking of the current item)
toggle-wrap                  ctrl-/  alt-/
toggle+down                  ctrl-i  (tab)
toggle+up                    btab    (shift-tab)
track-current                (track the current item; automatically disabled if focus changes)
transform(...)               (transform states using the output of an external command)
transform-border-label(...)  (transform border label using an external command)
transform-ghost(...)         (transform ghost text using an external command)
transform-header(...)        (transform header using an external command)
transform-header-label(...)  (transform header label using an external command)
transform-input-label(...)   (transform input label using an external command)
transform-list-label(...)    (transform list label using an external command)
transform-nth(...)           (transform nth using an external command)
transform-pointer(...)       (transform pointer using an external command)
transform-preview-label(...) (transform preview label using an external command)
transform-prompt(...)        (transform prompt string using an external command)
transform-query(...)         (transform query string using an external command)
transform-search(...)        (trigger fzf search with the output of an external command)
unbind(...)                  (unbind bindings)
unix-line-discard            ctrl-u
unix-word-rubout             ctrl-w
untrack-current              (stop tracking the current item; no-op if global tracking is enabled)
up                           ctrl-k  ctrl-p  up
yank                         ctrl-y
