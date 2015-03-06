default['cheflab']['lab_name'] = 'default-lab'
default['cheflab']['analytics']['security_group'] = [ {:ports => 0..65535, :protocol => :tcp, :sources => ['0.0.0.0/0'] } ]
default['cheflab']['chefserver']['security_group'] = [ {:ports => 0..65535, :protocol => :tcp, :sources => ['0.0.0.0/0'] } ]
default['cheflab']['gitlab']['security_group'] = [ {:ports => 0..65535, :protocol => :tcp, :sources => ['0.0.0.0/0'] } ]
default['cheflab']['jenkins']['security_group'] = [ {:ports => 0..65535, :protocol => :tcp, :sources => ['0.0.0.0/0'] } ]

default['cheflab']['analytics']['ssh_username'] = 'root'
default['cheflab']['analytics']['image_id'] = 'ami-b6bdde86'
default['cheflab']['analytics']['instance_type'] = 'm3.medium'
default['cheflab']['analytics']['key_name'] = 'fords-chef-provisioner'

default['cheflab']['chefserver']['ssh_username'] = 'root'
default['cheflab']['chefserver']['image_id'] = 'ami-b6bdde86'
default['cheflab']['chefserver']['instance_type'] = 'm3.medium'
default['cheflab']['chefserver']['key_name'] = 'fords-chef-provisioner'

default['cheflab']['gitlab']['ssh_username'] = 'root'
default['cheflab']['gitlab']['image_id'] = 'ami-b6bdde86'
default['cheflab']['gitlab']['instance_type'] = 'm3.medium'
default['cheflab']['gitlab']['key_name'] = 'fords-chef-provisioner'

default['cheflab']['jenkins']['ssh_username'] = 'root'
default['cheflab']['jenkins']['image_id'] = 'ami-b6bdde86'
default['cheflab']['jenkins']['instance_type'] = 'm3.medium'
default['cheflab']['jenkins']['key_name'] = 'fords-chef-provisioner'