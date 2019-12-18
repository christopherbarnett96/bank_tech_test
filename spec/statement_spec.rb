require 'account'

describe Statement do
  context 'Statement' do
    it 'prints a statment of deposits and withdrawals' do
      deposit = 600
      withdrawal_amount = 20.89
      subject.activity = ["#{Time.now.strftime('%d/%m/%Y')} || || #{format(20.89.to_s)} || #{format(579.11.to_s)}", "#{Time.now.strftime('%d/%m/%Y')} || 600.00 || || 600.00"]
      expected_statement = "\"date || credit || debit || balance\"\n\"#{Time.now.strftime('%d/%m/%Y')} || || #{withdrawal_amount} || 579.11\"\n\"#{Time.now.strftime('%d/%m/%Y')} || #{deposit}.00 || || 600.00\"\n"
      expect { subject.show }.to output(expected_statement).to_stdout
    end
  end
end
