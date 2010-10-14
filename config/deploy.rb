# RAILS_ROOT/config/deploy.rb
# server config
set :user, 'resolu11'
set :domain, "host377.hostmonster.com"
set :project, 'resolute' #project name in repository, pulls from trunk by default
set :application, 'resolute' #how the folder will appear in public_html (must setup subdomain as well in cPanel)
set :applicationdir, "/home2/#{user}/rails/#{application}"

# version control config
# NOTE:  hostmonster supports http port 80,   
#   svn port 3690 doesnt work,
#   and svn+ssh is not tested...
set :scm, "git"
set :repository,  "git@github.com:kfarst/resolute.git" 
set :user, "resolu11"  # The server's user for deploys
set :scm_passphrase, "elgxsy"  # The deploy user's password

# deployment config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache
set :branch, "master"

# production database config
set :db_type, "mysql"

# roles (servers)
role :app, domain
role :web, domain
role :db,  domain, :primary => true

# additional config options
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :chmod755, %w(app config db lib public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)
set :use_sudo, false

