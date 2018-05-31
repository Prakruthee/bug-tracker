set :stage, :production
set :branch, :demo_deployment
set :rails_env, :it
set :deploy_to, '/u01/apps/qwinix/bug_tracker'
set :log_level, :debug

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
role :app, %w{qwinix@192.168.2.106}
role :web, %w{qwinix@192.168.2.106}
role :db, %w{qwinix@192.168.2.106}
server '192.168.2.106', roles: %w{:web, :app, :db}, user: 'qwinix'

set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa),
   auth_methods: %w(publickey)
}