server '3.113.226.52', user: 'coolbanana409', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/private/ec2/id_rsa'
