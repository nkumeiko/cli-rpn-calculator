require 'spec_helper'

RSpec.describe App do
  subject { described_class.new }

  before do
    stub_const 'STDIN', double()
  end

  context '#run' do
    it 'processes multiple commands and quits' do
      allow(STDOUT).to receive(:print).with('> ')

      expect(STDIN).to receive(:gets).and_return('4 +')
      expect(STDOUT).to receive(:puts).with('Not enough operands.')

      expect(STDIN).to receive(:gets).and_return('5 +')
      expect(STDOUT).to receive(:puts).with(9.0)

      expect(STDIN).to receive(:gets).and_return('9')
      expect(STDOUT).to receive(:puts).with(9.0)

      expect(STDIN).to receive(:gets).and_return('/')
      expect(STDOUT).to receive(:puts).with(1.0)

      expect(STDIN).to receive(:gets).and_return('q')
      subject.run
    end
  end
end
