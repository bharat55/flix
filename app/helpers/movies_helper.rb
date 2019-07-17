module MoviesHelper
  def format_total_gross(movie)
    if movie.flop?
      "<strong>Flop!!</strong>".html_safe
    else
     "<strong>SuperHit  !!</strong>".html_safe

    end
  end

  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag('placeholder.png')
    else
      image_tag(movie.image_file_name)
    end
  end
  def average_stars(movie)
    avg = movie.reviews.average(:stars).to_i
    stars = ""
    avg.times do
       stars +="*"
    end
     stars
  end


end


