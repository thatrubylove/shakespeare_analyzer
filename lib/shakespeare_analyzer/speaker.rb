class Speaker < Value.new(:name, :lines)
  def line_count
    @lines.count
  end

  def to_s
    "#{line_count} #{@name.capitalize}"
  end
end
