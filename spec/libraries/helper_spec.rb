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
end
