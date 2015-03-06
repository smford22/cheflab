chef_gem 'chef-provisioning-aws'

require 'chef/provisioning/aws_driver'
with_driver 'aws'

lab_name = node['cheflab']['lab_name']

# Create the AWS Security Groups
%w[analytics chefserver gitlab jenkins].each do |sg|
  aws_security_group "#{lab_name}-#{sg}" do
    inbound_rules node['cheflab'][sg]['security_group']
  end  
end

machine_batch do 
  machine "#{lab_name}-analytics" do 
    machine_options(
      :ssh_username => node['cheflab']['analytics']['ssh_username'],
      :image_id => node['cheflab']['analytics']['image_id'],
      :bootstrap_options => {
        :instance_type => node['cheflab']['analytics']['instance_type'],
        :key_name => node['cheflab']['analytics']['key_name'],
        :security_groups => ["#{lab_name}-analytics"],
      }
    )
    tag "#{lab_name}-analytics"
  end

  machine "#{lab_name}-chefserver" do 
    machine_options(
      :ssh_username => node['cheflab']['chefserver']['ssh_username'],
      :image_id => node['cheflab']['chefserver']['image_id'],
      :bootstrap_options => {
        :instance_type => node['cheflab']['chefserver']['instance_type'],
        :key_name => node['cheflab']['chefserver']['key_name'],
        :security_groups => ["#{lab_name}-chefserver"],
      }
    )
    tag "#{lab_name}-chefserver"
    recipe 'cheflab::chef-server'
  end

  machine "#{lab_name}-gitlab" do 
    machine_options(
      :ssh_username => node['cheflab']['gitlab']['ssh_username'],
      :image_id => node['cheflab']['gitlab']['image_id'],
      :bootstrap_options => {
        :instance_type => node['cheflab']['gitlab']['instance_type'],
        :key_name => node['cheflab']['gitlab']['key_name'],
        :security_groups => ["#{lab_name}-gitlab"],
      }
    )
    tag "#{lab_name}-gitlab"
  end

  machine "#{lab_name}-jenkins" do 
    machine_options(
      :ssh_username => node['cheflab']['jenkins']['ssh_username'],
      :image_id => node['cheflab']['jenkins']['image_id'],
      :bootstrap_options => {
        :instance_type => node['cheflab']['jenkins']['instance_type'],
        :key_name => node['cheflab']['jenkins']['key_name'],
        :security_groups => ["#{lab_name}-jenkins"],
      }
    )
    tag "#{lab_name}-jenkins"
  end
end