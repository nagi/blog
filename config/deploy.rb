set :application, 'blog'
set :user, 'nagisys'
set :domain, 'nagisystems.com'
set :mongrel_port, '4002'
set :server_hostname, 'nagisystems.com'

set :git_account, 'nagi'
set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('Git Password: ') }

server "nagisystems.com", :app, :web, :db, :primary => true

default_run_options[:pty] = true
set :repository,  "git@github.com:#{git_account}/#{application}.git"
set :scm, "git"
set :user, user

ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"

after 'deploy:symlink', 'deploy:finishing_touches'

namespace :deploy do
   task :finishing_touches, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/environment.rb #{release_path}/config/environment.rb"
    run "ln -nfs #{shared_path}/public/.htaccess #{release_path}/public/.htaccess"
#    run "chmod 755 #{release_path}/public/dispatch.cgi"
#    run "chmod 755 #{release_path}/public/dispatch.fcgi"
#    run "chmod 755 #{release_path}/public/dispatch.rb"
    run "chmod 755 #{release_path}/script/about"
    run "chmod 755 #{release_path}/script/console"
    run "chmod 755 #{release_path}/script/dbconsole"
    run "chmod 755 #{release_path}/script/destroy"
    run "chmod 755 #{release_path}/script/plugin"
    run "chmod 755 #{release_path}/script/runner"
    run "chmod 755 #{release_path}/script/server"
    run "touch #{release_path}/log/production.log"
    run "chmod 666 #{release_path}/log/production.log"
    # deploy.reboot_mongrel
  end

#   desc "override passenger restart task"
#   task :restart do
#   end
#
#   desc "restart mongrel"
#   task :reboot_mongrel do
#     run "cd ~/script && ./restart-mon.sh"
#   end
end
