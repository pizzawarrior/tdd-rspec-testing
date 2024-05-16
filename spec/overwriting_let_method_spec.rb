# frozen_string_literal: true

class ProgrammingLanguage
  attr_reader :name

  def initialize(name = 'Python')
    @name = name
  end
end

RSpec.describe ProgrammingLanguage do
  # parent scope
  let(:language) { ProgrammingLanguage.new('Ruby') }

  it 'should store the name of the language' do
    expect(language.name).to eq('Ruby')
  end

  context 'with no argument' do
    # notice that this scope will overwrite the parent scope
    let(:language) { ProgrammingLanguage.new }
    it 'should inititalize with default name of Python' do
      expect(language.name).to eq('Python')
    end
  end
end
