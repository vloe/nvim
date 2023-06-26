local status, discord_presence = pcall(require, "presence")
if not status then
	print("discord presence not installed")
	return
end

discord_presence.setup({
	neovim_image_text = "https://github.com/vloe/nvim", -- Text displayed when hovered over the Neovim image
	show_time = false,

	-- text options
	editing_text = "editing %s",
	file_explorer_text = "browsing %s",
	git_commit_text = "committing changes",
	plugin_manager_text = "managing plugins",
	reading_text = "reading %s",
	workspace_text = "working on %s",
})
