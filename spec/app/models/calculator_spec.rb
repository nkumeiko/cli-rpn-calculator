require 'spec_helper'

RSpec.describe Calculator, type: :model do
  subject { described_class.new.apply(input_params) }

  context 'when input is valid' do
    context 'when addition' do
      let(:input_params) { '3 4 +' }

      it 'returns result' do
        is_expected.to eq 7
      end
    end

    context 'when addition' do
      let(:input_params) { '3 4 *' }

      it 'returns result' do
        is_expected.to eq 12
      end
    end

    context 'when addition' do
      let(:input_params) { '3 4 -' }

      it 'returns result' do
        is_expected.to eq -1.0
      end
    end

    context 'when addition' do
      let(:input_params) { '3 4 /' }

      it 'returns result' do
        is_expected.to eq 0.75
      end
    end

    context 'when several operators' do
      let(:input_params) { '5 3 4 + -' }

      it 'returns result' do
        is_expected.to eq -2.0
      end
    end
  end
end
