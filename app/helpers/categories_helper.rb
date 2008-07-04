module CategoriesHelper

  def all_categories(wanted, li = ['li'], ul = ['ul'], used = [])
    used ||= []; r ||= ''
    li[1], ul[1] = " class='#{li[1]}'", " class='#{ul[1]}'" if used == []
    to_array(Category.find(wanted)).each do |f|
      unless used.include?(f)
        used << f
        r += "<li>#{link_to(f.name,f)}"# unless f.name == 'Accueil'
        r += "<ul>" if f.categories != [] # On ouvre s'il y a d'autres sous-catégories
        f.categories.each do |s|
          r += "#{all_categories s.id, li, ul, used}" unless used.include?(s)
        end.join "</li><li>"
        @first ||= 0
        @first += 1 
        r += "</ul>" if f.categories != []
        r += "</li>" if @first == 1
      end
    end.join("</li>")
    "#{r}</li>"
  end

  def to_array(thing)
    thing.class == Array ? thing : [thing]
  end

end
