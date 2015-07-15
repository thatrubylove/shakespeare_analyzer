module SpeakerAggregator
  extend self

  def call(speakers)
    sort(aggregate(speakers))
  end

protected

  def speaker_names(speakers)
    speakers.map(&:name).uniq
  end

  def sort(speakers)
    speakers.sort { |a, b| b.line_count <=> a.line_count }
  end

  def aggregate(speakers)
    speaker_names(speakers).reduce([]) do |acc, name|
      lines = aggregate_lines_by_speaker(speakers, name)
      acc << Speaker.new(name, lines)
    end
  end

  def aggregate_lines_by_speaker(speakers, name)
    speakers.select { |obj| obj.name == name }.
             flat_map(&:lines)
  end
end
