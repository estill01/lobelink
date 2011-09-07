task :friendly_url do
	User.all.map(&:save)
end
