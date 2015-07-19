require 'ibliblio'

require 'minitest/autorun'
require 'minitest/pride'

describe "Acceptance tests" do
  let(:xml) { File.read("./sample.xml") }
  subject { Ibiblio.lc(xml) }

  describe "First witch" do
    it "has 3 lines" do
      subject.scan(/3 First Witch/).must_equal ["3 First Witch"]
    end
  end

  describe "Second Witch" do
    it "has 3 lines" do
      subject.scan(/3 Second Witch/).must_equal ["3 Second Witch"]
    end
  end

  describe "Third Witch" do
    it "has 1 lines" do
      subject.scan(/1 Third Witch/).must_equal ["1 Third Witch"]
    end
  end
end
