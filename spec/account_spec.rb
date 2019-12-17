require 'account'

describe Account do

  context 'Balance' do

    it 'shows the correct balance' do
      subject.add(10)
      expect(subject.balance).to eq 10.00
    end
  end
  context 'Debiting account' do

    before do
      subject.add(20.00)
    end

    it 'User can withdraw' do
      subject.withdraw(10.00)
      expect(subject.balance).to eq 10.00
    end

  end

  context 'Statement' do

    it 'prints a header' do
      header = "\"date || credit || debit || balance\"\n"
      expect { subject.statement }.to output(header).to_stdout
    end

    it 'prints a statment of deposits and withdrawals' do
      deposit = 600
      subject.add(deposit)
      withdrawal_amount = 20.89
      subject.withdraw(withdrawal_amount)
      expected_statement = "\"date || credit || debit || balance\"\n\"#{Time.now.strftime('%d/%m/%Y')} || || #{withdrawal_amount} || 579.11\"\n\"#{Time.now.strftime('%d/%m/%Y')} || #{deposit}.00 || || 600.00\"\n"
      expect { subject.statement }.to output(expected_statement).to_stdout
    end
  end

end
