require 'minitest/autorun'

require 'stringio'
require 'cssmin_cli'

describe CSSMinCli do
  subject { CSSMinCli.run(options) }

  describe "returns false if source or inline is not in options" do
    let (:options) { {} }

    it { subject.must_equal false }
  end

  describe "prints minified css to stdout if destination is not provided" do
    let (:options) do
      {:source => "test/fixtures/simple.css"}
    end

    let(:expected_minified_css) { IO.read("test/fixtures/simple.min.css").strip }

    it { Proc.new {subject}.must_output expected_minified_css }
  end

  describe "reads css from inline option" do
    let (:options) do
      {:inline => IO.read("test/fixtures/simple.css")}
    end

    let (:expected_minified_css) do
      IO.read("test/fixtures/simple.min.css").strip
    end

    it { Proc.new { subject }.must_output expected_minified_css }
  end

  describe "reads css from source option" do
    let (:options) do
      {:source => "test/fixtures/simple.css"}
    end

    let (:expected_minified_css) do
      IO.read("test/fixtures/simple.min.css").strip
    end

    it { Proc.new { subject }.must_output expected_minified_css }
  end

  describe "prints minified css to file if destination is provided" do
    let (:options) do
      {:inline => IO.read("test/fixtures/simple.css"),
       :destination => "test_result.min.css"}
    end

    after do
      File.delete("test_result.min.css")
    end
    
    it do
      subject
      File.exists?("test_result.min.css").must_equal true
    end
  end
end
