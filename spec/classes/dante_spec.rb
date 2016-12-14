require 'spec_helper'

describe 'dante' do
  context 'on rhel 7' do
    let(:facts) {{
      :fqdn                      => 'testkistn.test.lan.at',
      :hostname                  => 'testkistn',
      :osfamily                  => 'RedHat',
      :operatingsystemrelease    => '7.0.0',
      :operatingsystemmajrelease => '7',
      :architecture              => 'x86_64',
      :ipaddress                 => '10.0.0.1',
      :concat_basedir            => '/tmp',
    }}

    context "dante class without any parameters" do
      let(:params) {{ }}

      it {is_expected.to compile.with_all_deps}

      it {is_expected.to contain_Class('dante') }
      it {is_expected.to contain_Class('dante::params')}
      it {is_expected.to contain_Class('dante::install').that_comes_before('dante::config')}
      it {is_expected.to contain_Class('dante::config').that_notifies('dante::service')}
      it {is_expected.to contain_Class('dante::service')}

      it {is_expected.to contain_Package('dante-server').with_ensure('present')}
      it {is_expected.to contain_File('/etc/sockd.conf')}
      it {is_expected.to contain_Service('sockd')}
    end
  end

  context 'unsupported operating system' do
    describe 'dante class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it {expect{is_expected.to contain_Class('dante')}.to raise_error(Puppet::Error, /Nexenta not supported/)}
    end
  end
end
