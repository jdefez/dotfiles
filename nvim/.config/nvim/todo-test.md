# sources

 - https://www.reddit.com/r/neovim/comments/1sa95g4/no_more_press_enter_with_ui2_with_example/
 - https://github.com/ThorstenRhau/neovim/blob/66dcad81af30fd68c0b69ed91d46896519afaa73/lua/config/options.lua#L86-L133

```lua
-- Experimental UI2: floating cmdline and messages
o.cmdheight = 0
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = {
      [''] = 'cmd',
      empty = 'cmd',
      bufwrite = 'msg',
      confirm = 'cmd',
      emsg = 'msg',
      echo = 'msg',
      echomsg = 'msg',
      echoerr = 'msg',
      completion = 'cmd',
      list_cmd = 'pager',
      lua_error = 'msg',
      lua_print = 'msg',
      progress = 'msg',
      rpc_error = 'msg',
      quickfix = 'msg',
      search_cmd = 'cmd',
      search_count = 'cmd',
      shell_cmd = 'pager',
      shell_err = 'pager',
      shell_out = 'pager',
      shell_ret = 'msg',
      undo = 'msg',
      verbose = 'pager',
      wildlist = 'cmd',
      wmsg = 'msg',
      typed_cmd = 'cmd',
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.5,
      timeout = 4000,
    },
    pager = {
      height = 3,
    },
  },
})
```
