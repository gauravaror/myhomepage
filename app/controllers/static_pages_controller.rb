class StaticPagesController < ApplicationController

def home
end

def contact
@suscriber = Suscriber.new
end

def blog
end

def projectdemos
end

def papers
end

def pictures
end 

end
