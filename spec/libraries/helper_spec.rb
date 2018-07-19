require 'spec_helper'

RSpec.describe ExabgpCookbook::Helpers do
  subject do
    class DummyClass
      include ExabgpCookbook::Helpers
    end
    DummyClass.new
  end

  describe '#installation_name' do
    context 'when instance name is false' do
      let(:instance_name) { false }
      it 'returns exabgp' do
        expect(subject.installation_name(instance_name)).to eq 'exabgp'
      end
    end

    context 'when instance name is foo' do
      let(:instance_name) { 'foo' }
      it 'returns exabgp-foo' do
        expect(subject.installation_name(instance_name)).to eq 'exabgp-foo'
      end
    end
  end

  describe '#exabgp_instance_name' do
    context 'when instance name is exabgp' do
      it 'returns exabgp' do
        expect(subject.exabgp_instance_name(config_name: 'exabgp')).to eq 'exabgp'
      end
    end

    context 'when instance name is foo' do
      it 'returns exabgp-foo' do
        expect(subject.exabgp_instance_name(config_name: 'foo')).to eq 'exabgp-foo'
      end
    end
  end

  describe '#exabgp_config_path' do
    context 'with no parameters' do
      it 'returns a default config path' do
        expect(subject.exabgp_config_path).to eq '/etc/exabgp/exabgp.conf'
      end
    end

    context 'with a custom config_path and no config name' do
      let(:custom_path) { '/etc/foo' }
      it 'returns the custom config path' do
        expect(subject.exabgp_config_path(config_path: custom_path)).to eq "#{custom_path}/exabgp.conf"
      end
    end

    context 'with a custom config_path and a config name' do
      let(:custom_path) { '/etc/foo' }
      let(:custom_name) { 'baz' }

      it 'returns the custom config path' do
        expect(subject.exabgp_config_path(config_path: custom_path, config_name: custom_name)).to eq "#{custom_path}/exabgp-#{custom_name}.conf"
      end
    end
  end
end
