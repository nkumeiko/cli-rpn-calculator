require 'spec_helper'

RSpec.describe Operators::Subtraction, type: :model do
  subject { described_class }

  context '.applicable?' do
    it 'returns true for -' do
      expect(subject.applicable?('-')).to eq true
    end

    it 'returns false for something is not -' do
      expect(subject.applicable?('t')).to eq false
    end
  end

  context '.execute' do
    it 'returns 5 for 15 and 10' do
      expect(subject.execute(15, 10)).to eq 5
    end
  end

  context '.number_of_operands' do
     it 'returns 2' do
      expect(subject.number_of_operands).to eq 2
    end
  end
end
