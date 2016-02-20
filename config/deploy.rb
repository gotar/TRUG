lock '3.4.0'

set :application, 'TRUG'
set :repo_url, 'https://github.com/gotar/TRUG/'

set :deploy_to, '/home/gotar/Sites/TRUG'

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :publishing, :restart
end
