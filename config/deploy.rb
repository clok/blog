# config valid only for current version of Capistrano
lock '3.3.5'

# replace this with your site's name
set :application, "clokwork.net"
set :user, 'clok'
set :repo_url, 'git@github.com:clok/blog.git'
set :scm, :git
set :deploy_to, '/opt/clokwork.net/blog'

set :format, :pretty
namespace :deploy do
  task :update_jekyll do
    on roles(:app) do
      #within "#{deploy_to}/current" do
        execute "cd #{deploy_to}/current && /home/clok/.rvm/gems/ruby-2.2.0@global/wrappers/jekyll build"
      #end
    end
  end

end

after "deploy:symlink:release", "deploy:update_jekyll"