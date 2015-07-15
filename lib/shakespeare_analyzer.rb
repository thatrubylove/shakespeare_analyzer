require 'nokogiri'
require 'values'

require_relative 'shakespeare_analyzer/speakers_from_xml'
require_relative 'shakespeare_analyzer/speaker_aggregator'

module ShakespeareAnalyzer
  extend self

  def call(printer, xml)
    speakers  = SpeakersFromXml.call(xml)
    aggregate = SpeakerAggregator.call(speakers)
    printer.call(aggregate)
  end
end
