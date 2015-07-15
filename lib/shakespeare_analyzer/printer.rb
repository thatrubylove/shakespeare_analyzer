module Printer
  extend self

  def call(speakers)
    speaker.each { |speaker| puts speaker.to_s }
  end
end
