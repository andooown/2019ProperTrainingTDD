require_relative '../lib/speed'

describe Speed do
  let(:speed) { Speed.new }

  [
    { distance: 10.0, elapsed_time: 2.0, expect: 5.0 },
    { distance: 10.0, elapsed_time: 2, expect: 5.0 },
    { distance: 10, elapsed_time: 4, expect: 2.5 },
    { distance: 0, elapsed_time: 2, expect: 0 },
  ].each do |dataset|
    it { expect(speed.calc(dataset[:distance], dataset[:elapsed_time])).to eq dataset[:expect] }
  end

  [
    { distance: 10, elapsed_time: 0 },
    { distance: 10, elapsed_time: -1 },
    { distance: -10, elapsed_time: 100 },
  ].each do |dataset|
    it { expect{ speed.calc(dataset[:distance], dataset[:elapsed_time])}.to raise_error(ArgumentError) }
  end
end