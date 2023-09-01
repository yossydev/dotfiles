local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "gb",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Open file/folder in git repository
    browse = "go",
    -- Opens a new diff that compares against the current index
    diff = "gf",
    -- Close git diff
    diff_close = "gD",
  },
})
