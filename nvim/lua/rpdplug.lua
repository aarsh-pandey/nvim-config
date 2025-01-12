local M = {}

local pack_path = vim.fn.stdpath("data") .. "/site/pack"

-- Ensure the target directory exists
local function ensure_dir(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

-- Clone a GitHub repository
local function clone_repo(repo, dir)
  local repo_url = "https://github.com/" .. repo
  if vim.fn.isdirectory(dir) == 0 then
    print("Cloning " .. repo .. " into " .. dir)
    vim.fn.system({ "git", "clone", "--depth=1", repo_url, dir })
  else
    print(repo .. " already installed in " .. dir)
  end
end

-- Install a plugin
function M.install_plugin(repo, dir)
  local target_path = string.format("%s/%s/start/%s", pack_path, dir, vim.fn.fnamemodify(repo, ":t"))
  ensure_dir(string.format("%s/%s/start", pack_path, dir))
  clone_repo(repo, target_path)
end

-- Example usage: Call this function in your `init.lua` to install plugins
function M.setup(plugins)
  -- Add your plugins here

  for _, plugin in ipairs(plugins) do
    M.install_plugin(plugin.repo, plugin.dir)
  end
end

return M
