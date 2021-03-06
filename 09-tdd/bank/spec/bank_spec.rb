require_relative '../bank'

describe Bank do

  let(:bank) { Bank.new 'RSpec Bank' }

  describe '.new' do
    it 'creates a new bank object' do
      expect(bank).to_not eq nil
    end

    it 'has a name' do
      expect(bank.name).to eq 'RSpec Bank'
    end

    it 'has no accounts' do
      expect(bank.accounts.count).to eq 0
    end
  end

  describe '#create_account' do
    it "creates an account for a user with a given deposit" do
      bank.create_account 'Gerry', 200
      expect(bank.balance('Gerry')).to eq 200
    end
  end

  describe '#deposit' do
    it 'deposits an amount from the customer into the account' do
      bank.create_account 'Bill Murray', 2
      bank.deposit 'Bill Murray', 98
      expect(bank.balance('Bill Murray')).to eq 100
    end
  end

  describe '#withdraw' do
    it 'withdraws an amount from a customer\'s account' do
      bank.create_account 'Gazza', 100
      bank.withdraw 'Gazza', 50
      expect(bank.balance('Gazza')).to eq 50
    end

    it 'ignores requests for withdrawals exceeding the account balance' do
      bank.create_account 'Evil Guy', 1
      bank.withdraw 'Evil Guy', 1_000_000
      expect(bank.balance('Evil Guy')).to eq 1
    end
  end

  describe '#balance' do
    it 'returns the current balance for a given account' do
      bank.create_account 'Wes', 80
      expect(bank.balance('Wes')).to eq 80
    end
  end
end
