require 'spec_helper'

describe String do
  describe 'monkey patches' do
    describe '#shift' do
      let(:string) { 'this is my string' }

      it 'shifts off the first letter from the word destructively' do
        expect(string.shift).to eq('t')
        expect(string).to eq('his is my string')
      end
    end
  end
end
