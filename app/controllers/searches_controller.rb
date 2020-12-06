class SearchesController < ApplicationController


  def search
    @model = params["model"]
    @content = params["content"]
    @how = params["how"]
    if @model == 'User'
      @users = search_for(@how, @model, @content)
    else
      @books = search_for(@how, @model, @content)
    end
  end


 private

 def forward(model, content)
   if model == 'User'
     User.where("name LIKE?","#{content}%")
   elsif model == 'Book'
      Book.where("title LIKE?","#{content}%")
   end
 end

 def backword(model, content)
   if model == 'User'
     User.where("name LIKE?","%#{content}")
   elsif model == 'Book'
     Book.where("title LIKE?","%#{content}")
   end
 end

 def match(model, content)
   if model == 'User'
     User.where(name: content)
   elsif model == 'Book'
     Book.where(title: content)
   end
 end

 def partical(model, content)
   if model == 'User'
     User.where("name LIKE?","%#{content}%")
   elsif model == 'Book'
     Book.where("title LIKE?","%#{content}%")
   end
 end

 def search_for(how, model, content)
   case how
   when 'match'
      match(model, content)
   when 'partical'
      partical(model, content)
   when 'forward'
      forward(model, content)
   when 'backword'
      backword(model, content)
   end
 end

end
