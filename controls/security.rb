control 'ssh-root-login-disabled' do
  impact 1.0
  title 'Disable SSH root login'
  desc 'Root login over SSH must be disabled'

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

control 'firewalld-enabled' do
  impact 0.7
  title 'Firewall must be enabled'

  describe service('firewalld') do
    it { should be_enabled }
    it { should be_running }
  end
end
