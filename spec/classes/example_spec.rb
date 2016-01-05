require 'spec_helper'

describe 'dante' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "dante class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('dante::params') }
          it { is_expected.to contain_class('dante::install').that_comes_before('dante::config') }
          it { is_expected.to contain_class('dante::config') }
          it { is_expected.to contain_class('dante::service').that_subscribes_to('dante::config') }

          it { is_expected.to contain_service('dante') }
          it { is_expected.to contain_package('dante').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'dante class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('dante') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
