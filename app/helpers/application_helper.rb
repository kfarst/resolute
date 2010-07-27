module ApplicationHelper

  def only_whitespace?(string) 
    string.to_s.strip.empty?
  end
end
