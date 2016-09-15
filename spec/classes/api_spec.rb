require 'spec_helper'

describe('icinga2::feature::api', :type => :class) do
  let(:pre_condition) { [
    "class { 'icinga2': features => [], }"
  ] }

  on_supported_os.each do |os, facts|
    let :facts do
      facts
    end


    context "#{os} with ensure => present" do
      let(:params) { {:ensure => 'present'} }

      it { is_expected.to contain_icinga2__feature('api').with({'ensure' => 'present'}) }
    end


    context "#{os} with ensure => absent" do
      let(:params) { {:ensure => 'absent'} }

      it { is_expected.to contain_icinga2__feature('api').with({'ensure' => 'absent'}) }
    end


    context "#{os} with all defaults" do
      it { is_expected.to contain_icinga2__feature('api').with({'ensure' => 'present'}) }

      it { is_expected.to contain_file('/etc/icinga2/features-available/api.conf')
        .with_content(/accept_config = false/)
        .with_content(/accept_commands = false/) }
    end


    context "#{os} with accept_config => true" do
      let(:params) { {:accept_config => true} }

      it { is_expected.to contain_file('/etc/icinga2/features-available/api.conf')
        .with_content(/accept_config = true/) }
    end


    context "#{os} with accept_config => false" do
      let(:params) { {:accept_config => false} }

      it { is_expected.to contain_file('/etc/icinga2/features-available/api.conf')
        .with_content(/accept_config = false/) }
    end


    context "#{os} with accept_config => foo (not a valid boolean)" do
      let(:params) { {:accept_config => 'foo'} }

      it { is_expected.to raise_error(Puppet::Error, /"foo" is not a boolean/) }
    end


    context "#{os} with accept_commands => true" do
      let(:params) { {:accept_commands => true} }

      it { is_expected.to contain_file('/etc/icinga2/features-available/api.conf')
        .with_content(/accept_commands = true/) }
    end


    context "#{os} with accept_commands => false" do
      let(:params) { {:accept_commands => false} }

      it { is_expected.to contain_file('/etc/icinga2/features-available/api.conf')
        .with_content(/accept_commands = false/) }
    end


    context "#{os} with accept_commands => foo (not a valid boolean)" do
      let(:params) { {:accept_commands => 'foo'} }

      it { is_expected.to raise_error(Puppet::Error, /"foo" is not a boolean/) }
    end
  end


  context 'Windows 2012 R2 with ensure => present' do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:ensure => 'present'} }

    it { is_expected.to contain_icinga2__feature('api').with({'ensure' => 'present'}) }
  end


  context 'Windows 2012 R2 with ensure => absent' do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:ensure => 'absent'} }

    it { is_expected.to contain_icinga2__feature('api').with({'ensure' => 'absent'}) }
  end


  context "Windows 2012 R2 with all defaults" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    it { is_expected.to contain_icinga2__feature('api').with({'ensure' => 'present'}) }

    it { is_expected.to contain_file('C:/ProgramData/icinga2/etc/icinga2/features-available/api.conf')
      .with_content(/accept_config = false/)
      .with_content(/accept_commands = false/) }
  end


  context "Windows 2012 R2 with accept_config => true" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:accept_config => true} }

    it { is_expected.to contain_file('C:/ProgramData/icinga2/etc/icinga2/features-available/api.conf')
      .with_content(/accept_config = true/) }
  end


  context "Windows 2012 R2 with accept_config => false" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:accept_config => false} }

    it { is_expected.to contain_file('C:/ProgramData/icinga2/etc/icinga2/features-available/api.conf')
      .with_content(/accept_config = false/) }
  end


  context "Windows 2012 R2 with accept_config => foo (not a valid boolean)" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:accept_config => 'foo'} }

    it { is_expected.to raise_error(Puppet::Error, /"foo" is not a boolean/) }
  end


  context "Windows 2012 R2 with accept_commands => true" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:accept_commands => true} }

    it { is_expected.to contain_file('C:/ProgramData/icinga2/etc/icinga2/features-available/api.conf')
      .with_content(/accept_commands = true/) }
  end


  context "Windows 2012 R2 with accept_commands => false" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:accept_commands => false} }

    it { is_expected.to contain_file('C:/ProgramData/icinga2/etc/icinga2/features-available/api.conf')
      .with_content(/accept_commands = false/) }
  end


  context "Windows 2012 R2 with accept_config => foo (not a valid boolean)" do
    let(:facts) { {
      :kernel => 'Windows',
      :architecture => 'x86_64',
      :osfamily => 'Windows',
      :operatingsystem => 'Windows',
      :operatingsystemmajrelease => '2012 R2'
    } }
    let(:params) { {:accept_commands => 'foo'} }

    it { is_expected.to raise_error(Puppet::Error, /"foo" is not a boolean/) }
  end
end
