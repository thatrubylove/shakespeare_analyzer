require 'nokogiri'

module Ibiblio
  extend self

  def lc(xml)
    Play.new(xml).line_counts.map do |lc|
      [lc[:line_count], lc[:character]].join(" ")
    end.join("\n")
  end

  class Play
    def initialize(xml)
      @xml = xml
    end

    def line_counts
      @line_counts ||= characters.map do |name|
        {
          character: name,
          line_count: line_count_for(name)
        }
      end.sort {|a,b| b[:line_count] <=> a[:line_count] }
    end

    def characters
      @characters ||= xml_doc.search("SPEAKER").map(&:text).uniq
    end

    def dialogs
      @dialogs ||= xml_doc.search("SPEECH").map do |sp|
        speaker = sp.at("SPEAKER").text
        lines   = sp.search("LINE").map(&:text)
        {
          character: speaker,
          lines: lines
        }
      end
    end

  private

    attr_reader :xml

    def xml_doc
      @xml_doc ||= Nokogiri::XML(xml)
    end

    def line_count_for(name)
      dialogs.select do |d|
        d[:character] == name
      end.flat_map {|d| d[:lines] }.count
    end

  end
end
