require 'spec_helper'
require './app/models/node'

describe Node do
  describe 'creation' do
    it 'can be created with a word' do
      node = Node.new('weight')

      expect(node).to be_a(Node)
    end
    
    it 'can be created without a word' do
      node = Node.new

      expect(node).to be_a(Node)
    end
  end

  describe 'attributes' do
    let(:ac) { AutoCompleter.new }
    let(:node) { ac.root }

    describe 'children / kids' do
      before do
        ac.insert 'abs'
        ac.insert 'abdomen'
        ac.insert 'abbey'
      end

      it "it displays a hash of the node's children" do
        expect(node.children).to include('a')
        expect(node.children['a']).to be_a(Node)
        expect(node.kids['a'].kids['b'].kids).to include('b')
        expect(node.kids['a'].kids['b'].kids).to include('d')
        expect(node.kids['a'].kids['b'].kids).to include('s')
      end
    end
  end
end
