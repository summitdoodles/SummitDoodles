set :user, "summitdoodles"

set :ssh_options, {:forward_agent => true}
set :use_sudo, true
ssh_options[:forward_agent] = true

set :application, "SummitDoodles.com"
set :repository,  "git@github.com:summitdoodles/SummitDoodles.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "www.summitdoodles.com"                          # Your HTTP server, Apache/etc
role :app, "www.summitdoodles.com"                          # This may be the same as your `Web` server
role :db,  "www.summitdoodles.com", :primary => true # This is where Rails migrations will run
role :db,  "www.summitdoodles.com"


task :development do
    set :deploy_to, "/home/summitdoodle/rails_apps/dev"
    set :rails_env,'development'
end

task :production do
    set :deploy_to, "/home/summitdoodle/rails_apps/prod"
    set :rails_env, 'production'
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end


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