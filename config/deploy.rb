# URL/sökväg to your Git-repo, relativt to your target deploy server
set :repository, 'git://github.com/Burgestrand/vanilla-deploy.git'
set :revision, 'origin/master'

# Path to where to place your project on the deploy server
set :deploy_to, '/tmp/vanilla-deploy'

# Address to SSH in to
set :domain, 'Kim@localhost'

# Shared paths to be symlinked on deploy
set :shared_paths, shared_paths.merge({
  'config' => 'config',
  'assets' => 'public/assets',
  'tmp'    => 'tmp',
  'log'    => 'log'
})