module DilemmasHelper
  def dilemma_tags(dilemma)
    dilemma.tags.each do |t|
      return link_to(t.name, tag_path(t))
    end
  end
end
