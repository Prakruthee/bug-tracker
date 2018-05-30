set :stage, :it
set :branch, :demo_deployment
set :rails_env, :it
set :deploy_to, '/u01/apps/qwinix/bug-tracker'
set :log_level, :debug

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
role :app, %w{qwinix-pc@192.168.2.130}
role :web, %w{qwinix-pc@192.168.2.130}
role :db, %w{qwinix-pc@192.168.2.130}
server '192.168.2.130', roles: %w{:web, :app, :db}, user: 'qwinix-pc'

set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa),
   auth_methods: %w(publickey)
}