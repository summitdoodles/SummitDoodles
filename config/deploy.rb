
#   Global variables
set :ssh_options, {:forward_agent => true}
set :use_sudo, false
set :user, "summitdoodles"
set :application, "SummitDoodles.com"
set :repository,  "git@github.com:summitdoodles/SummitDoodles.git"
set :deploy_to, "/home/summitdoodles/rails_apps/dev"
set :scm, :git
set :shared_dir, "/home/summitdoodles/rails_apps/shared"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
ssh_options[:forward_agent] = true
role :web, "www.summitdoodles.com"                          # Your HTTP server, Apache/etc
role :app, "www.summitdoodles.com"                          # This may be the same as your `Web` server
role :db,  "www.summitdoodles.com", :primary => true # This is where Rails migrations will run
role :db,  "www.summitdoodles.com"



task :development do
    set :deploy_to, "/home/summitdoodles/rails_apps/dev"
    set :rails_env,'development'
end

task :production do
    set :deploy_to, "/home/summitdoodles/rails_apps/prod"
    set :rails_env, 'production'
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do

  task :symlink_shared do
    run "ln -nfs #{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_dir}/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    run "ln -s #{shared_dir}/log #{release_path}/log"
  end

   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

   task :rake_migration do
    run "cd #{current_path}; rake db:migrate"
   end
end

after 'deploy','deploy:symlink_shared', 'deploy:rake_migration'
#after 'deploy:production','deploy:symlink_shared'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end