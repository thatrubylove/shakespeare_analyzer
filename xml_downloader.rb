require 'open-uri'

module XmlDownloader
  extend self
  def call(uri)
    open(uri).read
  end
end

require 'minitest/autorun'
require 'minitest/pride'

describe XmlDownloader do
  let(:uri) { "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml" }
  subject { XmlDownloader.call(uri) }

  it "must include the title Macbeth" do
    subject.scan(/The Tragedy of Macbeth/).must_equal ["The Tragedy of Macbeth"]
  end
end


