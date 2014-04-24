require 'minitest/autorun'

require 'stringio'
require 'cssmin_cli'

describe CSSMinCli do
  subject { CSSMinCli.run(options) }

  describe "returns false if source or inline is not in options" do
    let(:options) { {} }

    it { subject.must_equal false }
  end

  describe "prints minified css to stdout if destination is not provided" do
    let(:options) { {:source => "test/fixtures/simple.css"}}

    let(:expected_minified_css) { IO.read("test/fixtures/simple.min.css").strip }

    before do
      @destination = StringIO.new
      $stdout = @destination
    end

    after do
      $stdout = STDOUT
    end

    it { @destination.string.must_equal expected_minified_css }

  end
end
