require 'spec_helper'

RSpec.describe ExabgpCookbook::Helpers do
  subject do
    class DummyClass < Chef::Node
      include ExabgpCookbook::Helpers
    end
    DummyClass.new
  end

  describe '#installation_name' do
    before do
      allow(subject).to receive(:new_resource).and_return(new_resource)
      allow(new_resource).to receive(:instance_name).and_return(instance_name)
    end

    let(:new_resource) { double('new_resource') }

    context 'when instance name is blank' do
      let(:instance_name) { '' }
      it 'returns exabgp' do
        expect(subject.installation_name).to eq 'exabgp'
      end
    end

    context 'when instance name is default' do
      let(:instance_name) { 'default' }
      it 'returns exabgp' do
        expect(subject.installation_name).to eq 'exabgp'
      end
    end

    context 'when instance name is foo' do
      let(:instance_name) { 'foo' }
      it 'returns exabgp-foo' do
        expect(subject.installation_name).to eq 'exabgp-foo'
      end
    end
  end
end
