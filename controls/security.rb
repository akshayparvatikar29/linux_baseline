control 'ssh-root-login-disabled' do
  impact 1.0
  title 'Disable SSH root login'

  describe sshd_config do
    its('PermitRootLogin') { should cmp 'no' }
  end
end

control 'password-auth-disabled' do
  impact 0.9
  title 'Disable SSH password authentication'

  describe sshd_config do
    its('PasswordAuthentication') { should cmp 'no' }
  end
end

control 'nginx-installed' do
  impact 0.5
  title 'Nginx must be installed'

  describe package('nginx') do
    it { should be_installed }
  end
end

control 'automatic-security-updates-enabled' do
  impact 0.7
  title 'Automatic security updates must be enabled'

  describe package('unattended-upgrades') do
    it { should be_installed }
  end

  describe file('/etc/apt/apt.conf.d/20auto-upgrades') do
    it { should exist }
    its('content') { should match(/APT::Periodic::Unattended-Upgrade\s+"1";/) }
  end
end
