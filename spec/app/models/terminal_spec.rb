require 'spec_helper'

RSpec.describe Terminal, type: :model do
  subject { described_class.new }

  context '#read' do
    it 'prints > stdin' do
      expect(STDOUT).to receive(:print).with('> ')
      expect(STDIN).to receive(:gets).and_return('4')
      expect(subject.read).to eq '4'
    end
  end

  context '#write' do
    it 'prints output to stdout' do
      expect(STDOUT).to receive(:puts).with('test')
      subject.write('test')
    end
  end
end
