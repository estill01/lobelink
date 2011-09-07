task :friendly_id do
	User.all.map(&:save)
end
