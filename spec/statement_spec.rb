require 'account'

describe Statement do

  context 'Statement' do

    it 'prints a statment of deposits and withdrawals' do
      deposit = 600
      withdrawal_amount = 20.89
      subject.activity = ["#{Time.now.strftime('%d/%m/%Y')} || || #{'%.2f' % 20.89} || #{'%.2f' % 579.11}", "#{Time.now.strftime('%d/%m/%Y')} || #{'%.2f' % 600} || || #{'%.2f' % 600}"]
      expected_statement = "\"date || credit || debit || balance\"\n\"#{Time.now.strftime('%d/%m/%Y')} || || #{withdrawal_amount} || 579.11\"\n\"#{Time.now.strftime('%d/%m/%Y')} || #{deposit}.00 || || 600.00\"\n"
      expect { subject.show }.to output(expected_statement).to_stdout
    end
  end

end
