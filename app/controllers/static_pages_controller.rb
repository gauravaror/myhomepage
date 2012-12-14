class StaticPagesController < ApplicationController

def home
end

def contact
@suscriber = Suscriber.new
end

def projectdemos
end

def papers
end

def pictures
end 

end
