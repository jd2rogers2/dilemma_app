module DilemmasHelper
  def dilemma_tags(dilemma)
    dilemma.tags.each do |t|
      return link_to(t.name, tag_path(t))
    end
  end

  def dilemma_link(dilemma)
    link_to(dilemma.name, dilemma_path(dilemma))
  end

  def author_deadline(dilemma)
    "author: #{dilemma.author.email} | deadline: #{dilemma.pretty_deadline}"
  end

end
