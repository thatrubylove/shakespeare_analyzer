require 'ibliblio'

require 'minitest/autorun'
require 'minitest/pride'

describe Ibiblio::Play do
  let(:xml) { File.read("./sample.xml") }

  describe "characters" do
    subject { Ibiblio::Play.new(xml).characters }
    it { subject.must_equal ["First Witch", "Second Witch", "Third Witch"] }
  end

  describe "speeches" do
    subject { Ibiblio::Play.new(xml).dialogs }
    it { subject[0].must_equal(
      {
        character: "First Witch",
        lines: [ "When shall we three meet again",
                "In thunder, lightning, or in rain?" ]
      }
    )}
  end

  describe "line_counts" do
    subject { Ibiblio::Play.new(xml).line_counts }
    it {
      subject[0].must_equal( { character: "First Witch", line_count: 3 } )
    }
  end
end
