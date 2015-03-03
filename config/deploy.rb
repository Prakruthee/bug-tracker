# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'BugTracker'
set :repo_url, 'https://github.com/Prakruthee/bug-tracker.git'
set :scm, :git

set :format, :pretty

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :linked_files, %w{config/database.yml config/security.yml}

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :keep_releases, 5

set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_dir, -> { shared_path.join('bundle') }
set :bundle_flags, '--deployment --quiet'
set :bundle_without, %w{development test}.join(' ')
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_roles, :all
set :bundle_bins, %w(gem rake rails)
set :whenever_roles, :all


namespace :deploy do

	desc "Copy database.yml.example"
	task :copy_database_yml do
		on roles(:app) do
			execute "mkdir -p #{shared_path}/config"
			execute "cp -f #{release_path}/config/database.example.yml #{shared_path}/config/database.yml"
			execute "rm -f #{release_path}/config/database.yml"
			execute "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
			execute "rm -f #{release_path}/config/database.example.yml"
		end
	end

	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
      puts "RESTARTED SUCCESSFULLY"
  end
end

after :publishing, :restart

after :restart, :clear_cache do
	on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
  end
end

end
