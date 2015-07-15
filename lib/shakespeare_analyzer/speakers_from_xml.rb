require_relative 'speaker'

module SpeakersFromXml
  extend self

  def call(xml)
    speakers_from(xml)
  end

protected

  def xml_doc(xml)
    Nokogiri::XML(xml)
  end

  def speakers_from(xml)
    xml_doc(xml).search('SPEECH').map do |speech|
      speaker = speech.at('SPEAKER').text
      lines   = speech.search('LINE').map(&:text)
      Speaker.new(speaker, lines)
    end
  end
end
