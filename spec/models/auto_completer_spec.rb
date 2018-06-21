require 'spec_helper'
require './app/models/auto_completer'

describe AutoCompleter do
  describe 'creation' do
    let(:ac) { described_class.new }

    it 'can be created' do
      expect(ac).to be_an(AutoCompleter)
    end
  end

  describe 'attributes' do
    let(:ac) { described_class.new }

    describe 'root' do
      it 'returns the root node' do
        expect(ac.root).to be_a(Node)
      end
    end
  end

  describe 'instance methods' do
    let(:ac) { described_class.new }

    describe '#insert' do
      it 'inserts a word into the tree' do
        expect(ac.insert('some')).to eq('some') 
        expect(ac.root.kids).to include('s')
        expect(ac.root.kids['s'].kids).to include('o')
        expect(ac.root.kids['s'].kids['o'].kids).to include('m')
        expect(ac.root.kids['s'].kids['o'].kids['m'].kids).to include('e')
        expect(ac.root.kids['s'].kids['o'].kids['m'].kids['e'].kids).to be_empty 
      end

      it 'will not insert duplicate nodes' do
        ac.insert('no') 
        ac.insert('nope') 

        expect(ac.root.kids.size).to eq(1)
        expect(ac.root.kids['n'].kids.size).to eq(1)
        expect(ac.root.kids['n'].kids['o'].kids.size).to eq(1)
      end
    end

    describe '#traverse' do
      it 'traverses the tree to a substring' do
        ac.insert 'abs'
        ac.insert 'abdomen'
        ac.insert 'abomination'

        expect(ac.traverse('ab')).to be_a(Node) 
        expect(ac.traverse('ab').letter).to eq('b')
        expect(ac.traverse('abdo').letter).to eq('o')
        expect(ac.traverse('abomi').letter).to eq('i')
        expect(ac.traverse('abomination').letter).to eq('n')
        expect(ac.traverse('abominations')).to be_falsey 
        expect(ac.traverse('barnacle')).to be_falsey 
        expect(ac.traverse('farquad')).to be_falsey 
      end
    end
  end
end
