# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'bugtracker'
set :repo_url, 'https://github.com/Prakruthee/bug-tracker.git'
set :scm, :git

set :format, :pretty

set :default_env, { :path => "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.0.0-p247'
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :bundle_gemfile, proc { release_path.join('Gemfile') }
set :bundle_dir, proc  { shared_path.join('bundle') }
set :bundle_flags, '--deployment --quiet'
set :bundle_without, %w{development test}.join(' ')
set :bundle_binstubs, proc  { shared_path.join('bin') }
set :bundle_roles, :all
set :bundle_bins, %w(gem rake rails)
set :ssh_options, {
	config: false
}

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5


# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

before 'deploy:updated', 'deploy:copy_database_yml'

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
		on roles(:app), :in => :sequence, :wait => 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
  end
end

after :restart, :clear_cache do
	on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
  end
end
after :finishing, 'deploy:cleanup'
end
