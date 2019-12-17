require 'account'

describe Account do

  context 'Balance' do
    it 'shows the correct balance' do
      subject.add(10)
      expect(subject.balance).to eq 10.00
    end
  end

end
